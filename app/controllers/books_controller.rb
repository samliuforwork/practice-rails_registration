class BooksController < ApplicationController
    def index
        @books = Book.all
        p "-" * 30
        p params
        p "-" * 30
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(clear_params)

        if @book.save
            redirect_to '/books'
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id:params[:id])
    end

    def edit
        @book = Book.find_by(id:params[:id])
    end

    def update
        @book = Book.find_by(id:params[:id])
        if @book.update(clear_params)
            redirect_to '/books'
        else
            render :edit
        end
    end

    def destroy
        @book = Book.find_by(id:params[:id])
        @book.destroy
    end

    private
    def clear_params
    params.require(:book).permit(:title, :price)
    end
end