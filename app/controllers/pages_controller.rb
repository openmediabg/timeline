class PagesController < ApplicationController
  def show
    @page = Page.by_slug params[:id]
    @page_title = @page.title
  end
end
