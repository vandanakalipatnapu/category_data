class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:new]
	def new
		@categories = Category.all
		@book = Book.new
		
	end

	def create
		@categories = Category.all
		  # raise params[:book].inspect
	    @book = Book.new(book_params)
		if @book.save
			
			redirect_to books_path
		else
			render 'new'
		end
	end

	def index
		@category = Category.all
		@books = Book.all
	end

	def edit
		@categories = Category.all
		@book = Book.find(params[:id])
	end

	def update
		@categories = Category.all
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to books_path
		else
			render 'edit'
		end

	end

	def destroy
		# @categories = Category.all
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def show
        @book = Book.find(params[:id])
        if @book.user_id==nil
        @book.update(user_id: current_user.id)
        
        # user_id = @book.user_id
        # @user = User.find(user_id)
		
        else
        	# raise params.inspect
            # redirect_to books_path
           render 'show'
        end
    end
    
    def return
    	# raise params.inspect
    	@book = Book.find(params[:book_id])
    	@book.update(user_id: nil)
    	redirect_to books_path
    	
    end

    def description
    	@book = Book.find(params[:book_id])
    	user_id = @book.user_id
    	@user = User.find(user_id)
	end

	private
		def book_params
			params[:book].permit(:book_name,:description,:category_id)
		end


end
