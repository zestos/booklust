class BookUsersController < ApplicationController
  before_filter :authorize

  def index
    @books = current_user.books.uniq { |book| book.title }
  end

  def create
    if !BookUser.find_by_book_id(params[:book_id])
      BookUser.create(book_id: params[:book_id], user_id: current_user.id)
    end
    render nothing: true
  end

  def destroy
    id = BookUser.where(book_id: params[:id])
    BookUser.delete(id)
    render nothing: true
  end

end
