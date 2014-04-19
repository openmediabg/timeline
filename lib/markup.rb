class Markup
  def self.format(text)
    result = RDiscount.new(text).to_html
    result = Sanitize.clean(result, Sanitize::Config::RELAXED)

    result.html_safe
  end
end
