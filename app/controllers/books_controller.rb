class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data

    def index
        render json: @data
    end

    #Show a single book
    def show
        puts params[:title]
        @data.each do |book|
            if params[:title] == book[:title]
                render json: book
            end
        end
    end

    #Create a new book
    def create
        @data << { title: params[:title], author: params[:author]} 
        render plain: @data
    end

    #Update a book
    def update
        @data.each do |book|
            if params[:title] == book[:title]
                book[:title] = params[:new_title]
                book[:author] = params[:new_author]
            end
        end
        render plain: @data
    end

    #Remove a book
    def destroy
        @data.each do |book|
            if params[:title] == book[:title]
                @data.delete(book)
            end
        end
        render plain: @data
    end

    private
    def setup_data
        @data = [
            { title: "Harry Potter", author: "J.K Rowling" },
            { title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
        puts "new data!"
    end
end
