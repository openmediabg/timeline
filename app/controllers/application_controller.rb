require_dependency 'translated_flash_messages'

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_official_deployment

  private

  def redirect_to_official_deployment
    uri = URI.parse request.url
    uri.hostname = 'timeline.openmedia.bg'
    redirect_to uri.to_s, status: 301
  end

  include TranslatedFlashMessages
end
