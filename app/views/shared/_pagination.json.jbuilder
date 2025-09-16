current_page, total_pages, total_count, default_per_page =
  pageable.current_page,
  pageable.total_pages,
  pageable.total_count,
  pageable.default_per_page

json.pagination do
  json.current current_page
  json.previous pageable.prev_page
  json.next pageable.next_page
  json.per_page pageable.limit_value
  json.pages total_pages
  json.count total_count
  json.range pagination_range(current_page: current_page, total_pages: total_pages)
  json.steps pagination_steps(per_page: default_per_page, total_count: total_count)
  json.summary pagination_summary(current_page: current_page, per_page: default_per_page, total_count: total_count)
end