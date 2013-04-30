#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require timelinejs/js/timeline-min
#= require timelinejs/js/storyjs-embed
#= require timelinejs/js/locale/bg
#= require_tree .

$ ->
  $('div[data-timeline]').each ->
    container  = $ this
    dataSource = container.data 'timeline'

    createStoryJS
      type: 'timeline'
      width: container.width()
      height: '600'
      lang: 'bg'
      source: dataSource
      embed_id: this.id
      hash_bookmark: true
