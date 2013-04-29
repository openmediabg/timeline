class Markup
  def self.format(text)
    result = RDiscount.new(text).to_html
    result = Sanitize.clean(result, Sanitize::Config::BASIC)

    result.html_safe
  end
end
