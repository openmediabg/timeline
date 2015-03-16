require_dependency 'markup'

class TimelineData
  def initialize(events = nil)
    @events = events || Event.published.in_chronological_order
    @intro  = Page.by_slug 'timeline-intro'
  end

  def to_json
    timeline = {
      type: 'default',
      date: events_as_json,
    }

    if @intro
      timeline = timeline.merge headline: @intro.title, text: markup(@intro.content)
    end

    {timeline: timeline}.to_json
  end

  private

  def events_as_json
    @events.map do |event|
      details = {
        startDate: format_date(event.start_date),
        endDate:   format_date(event.end_date || event.start_date),
        headline:  event.title,
        text:      markup(event.description),
      }

      if event.image? or event.external_image_url
        image_url = if event.image?
                      event.image.url(:medium)
                    else
                      event.external_image_url
                    end

        details[:asset] = {
          media:   image_url,
          credit:  event.image_credit,
          caption: event.image_caption,
        }
      end

      details
    end
  end

  def markup(text)
    Markup.format text
  end

  def format_date(date)
    date.strftime '%Y,%m,%d'
  end
end

__END__

"timeline":
{
    "headline":"The Main Timeline Headline Goes here",
    "type":"default",
    "text":"<p>Intro body text goes here, some HTML is ok</p>",
    "asset": {
        "media":"http://yourdomain_or_socialmedialink_goes_here.jpg",
        "credit":"Credit Name Goes Here",
        "caption":"Caption text goes here"
    },
    "date": [
        {
            "startDate":"2011,12,10",
            "endDate":"2011,12,11",
            "headline":"Headline Goes Here",
            "text":"<p>Body text goes here, some HTML is OK</p>",
            "tag":"This is Optional",
            "classname":"optionaluniqueclassnamecanbeaddedhere",
            "asset": {
                "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
                "thumbnail":"optional-32x32px.jpg",
                "credit":"Credit Name Goes Here",
                "caption":"Caption text goes here"
            }
        }
    ],
    "era": [
        {
            "startDate":"2011,12,10",
            "endDate":"2011,12,11",
            "headline":"Headline Goes Here",
            "text":"<p>Body text goes here, some HTML is OK</p>",
            "tag":"This is Optional"
        }

    ]
}
