class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id]) 
    @comment = BookComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book)
  end
  
  def destroy
      BookComment.find(params[:id]).destroy
      redirect_back(fallback_location: root_path)
   
  end
  
  private

  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
