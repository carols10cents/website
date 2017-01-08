class BooksController < ApplicationController
  before_action :set_book, only: [:show, :extras]

  def index
    @html_id = "page"
    @body_id = "books"
    @title   = "Books"

    @bullet_books  = Book.where(series: "bullet").shuffle
    @letters_books = Book.all.shuffle[1..4]
  end

  def show
    @html_id = "page"
    @body_id = "books"
    @title   = "Books : #{@book.title}"
  end

  def extras
    @html_id = "page"
    @body_id = "books"
    @title   = "Books : #{@book.title} : Extras"
  end

  private

  def set_book
    @book = Book.find_by(slug: params[:slug])
  end
end