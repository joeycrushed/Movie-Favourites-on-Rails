class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    # @list = params[:list_id]
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(books_params)
    @bookmark.list = @list # <--- please explain
      if @bookmark.save
        redirect_to list_path(@list)
      else
        render :new
      end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    list = bookmark.list # finding id of the list so we can redirect to it
    bookmark.destroy
    redirect_to lists_path(list)
  end

  # def create
  #   @list = list.find(:list_id)
  #   @bookmark = Bookmark.new(params[:list_id])
  #   if @bookmark.save
  #     redirect_to lists_path
  #   else
  #     render :new
  #   end
  # end

  private

  def books_params
     params.require(:bookmark).permit(:comment, :movie_id)
  end
end

# ids stored in http requests params gives us acces
