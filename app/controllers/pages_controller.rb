class PagesController < ApplicationController
  def show
    @page = Page.by_slug(params[:id]) or raise ActiveRecord::RecordNotFound
    @page_title = @page.title
  end
end
