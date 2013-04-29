module TranslatedFlashMessages
  def flash_message(scope, *args)
    controller_name_with_modules = params[:controller].gsub('/', '.')
    t("#{controller_name_with_modules}.flashes.#{scope}", *args)
  end
end
