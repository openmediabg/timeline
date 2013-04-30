require_dependency 'markup'

module ApplicationHelper
  def markup(text)
    Markup.format text
  end

  def top_navigation_urls
    {
      I18n.t('nav.home')                    => root_path,
      I18n.t('nav.about')                   => page_path(:about),
    }
  end

  def flash_to_alert_type(flash_type)
    case flash_type.to_sym
    when :notice then 'success'
    when :alert  then 'error'
    else              'info'
    end
  end

  def page_title(title = nil)
    title ||= @page_title
    application_name = t('application.name')

    if title
      t 'application.title', title: title, application_name: application_name
    else
      application_name
    end
  end
end
