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
end
