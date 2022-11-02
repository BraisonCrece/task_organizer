class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] || 'es'
  end
end
