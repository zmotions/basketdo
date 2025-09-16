module Basketdo
  module Kaminari
    module JsonPaginator
      ##
      # @author Gemini 2.5 Pro 🤝 Zafer Dogan (showcase: Implementing AI where it saves time)
      # @param current_page [Integer] The current active page.
      # @param total_pages [Integer] The total number of pages available.
      # @param window [Integer] The radius of the inner sliding window.
      # @param outer_window [Integer] The number of pages for the outer window.
      # @param left [Integer, nil] Overrides `outer_window` for the left side.
      # @param right [Integer, nil] Overrides `outer_window` for the right side.
      #
      # @return [Array<Integer, Symbol>] An array of page numbers and :ellipsis symbols.
      #
      def pagination_range(current_page:, total_pages:, window: nil, outer_window: nil, left: nil, right: nil)
        # --- 1. Input Sanitization ---
        current_page = current_page.to_i
        total_pages = total_pages.to_i
        window = window.nil? ? ::Kaminari.config.window : [0, window.to_i].max
        window = window.even? ? window + 1 : window
        outer_window = outer_window.nil? ? ::Kaminari.config.outer_window : [0, outer_window.to_i].max

        # Determine the final padding for each side using the hierarchy.
        # If `left` is nil, use `outer_window`. Otherwise, use `left`.
        final_left = if left.nil?
                       ::Kaminari.config.left.zero? ? outer_window : [0, left.to_i].max
                     else
                       [0, left.to_i].max
                     end
        # If `right` is nil, use `outer_window`. Otherwise, use `right`.
        final_right = if right.nil?
                        ::Kaminari.config.right.zero? ? outer_window : [0, right.to_i].max
                      else
                        [0, right.to_i].max
                      end

        return [] if total_pages <= 1
        current_page = [1, [current_page, total_pages].min].max

        # --- 2. Calculate page groups using final padding values ---
        inner_start = current_page - window
        inner_end = current_page + window

        left_outer_start = 1
        left_outer_end = final_left

        right_outer_start = total_pages - final_right + 1
        right_outer_end = total_pages

        # --- 3. Combine, sort, and filter ---
        pages = Set.new
        pages.merge(left_outer_start..left_outer_end)
        pages.merge(inner_start..inner_end)
        pages.merge(right_outer_start..right_outer_end)

        sorted_pages = pages.select { |p| p.between?(1, total_pages) }.sort

        # --- 4. Inject ellipsis into the gaps ---
        result = []
        previous_page = 0

        sorted_pages.each do |page|
          result << :ellipsis if (page - previous_page) > 1
          result << page
          previous_page = page
        end

        result
      end

      def pagination_steps(per_page:, total_count:, limit: 1000)
        per_page = per_page.to_i
        total_count = total_count.to_i
        Enumerator.produce(per_page) {|x| x * 2}.take_while {|num| num < [total_count, limit].min }
      end

      def pagination_summary(current_page:, per_page:, total_count:)
        # Return immediately if there are no records.
        return "0-0 of 0" if total_count.zero?

        # Calculate the starting record number.
        start_record = (current_page - 1) * per_page + 1

        # Calculate the ending record number.
        # This is the smaller of (the normal end of the page) or (the total records).
        end_record = [current_page * per_page, total_count].min

        {
          range: "#{start_record}-#{end_record}",
          total: total_count
        }
      end
    end
  end
end