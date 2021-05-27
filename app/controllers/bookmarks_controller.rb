class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = list.find(:list_id)
    @bookmark = Bookmark.new(params[:list_id])
    if @bookmark.save
    else
      render :new
  end

  private



  def books_param
  end

end
