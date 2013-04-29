module ApplicationHelper
  def markup(text)
    Markup.format text
  end

  def top_navigation_urls
    {
      I18n.t('nav.home')                    => root_path,
      I18n.t('nav.about')                   => 'TODO',
    }
  end

  def flash_to_alert_type(flash_type)
    case flash_type.to_sym
    when :notice then 'success'
    when :alert  then 'error'
    else              'info'
    end
  end
end
