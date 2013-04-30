require_dependency 'translated_flash_messages'

class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  include TranslatedFlashMessages
end
