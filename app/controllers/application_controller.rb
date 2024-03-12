class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    # Extract language from query parameter or use default
    @locale = params[:lang] || I18n.default_locale
    I18n.locale = @locale
  end
end
