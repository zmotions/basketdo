class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    # Extract language from query parameter or use default
    @locale = params[:lang] || I18n.default_locale
    I18n.locale = @locale
  end

  def filter_param(key)
    found_params = filter_params[:filter]
    found_params&.[](key)
  end

  def pagination_item
    params.permit(pagination: [:page, :per_page])
  end

  def paginate(scope, default_per_page = ::Kaminari.config.default_per_page)
    item = pagination_item[:pagination]
    scope.page(item[:page]).per((item[:per_page] || default_per_page).to_i)
  end

  def filter_params
    params.permit(filter: allowed_filter_params)
  end

  def allowed_filter_params
    [:query]
  end
end
