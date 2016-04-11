class Book < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	validates :book_name,:category_id,presence:true
	validates :book_name,:description,format:{with:/\A[a-zA-Z0-9|\.|\s|\,]+\z/, message: "Enter valid name"},:uniqueness => true
	validates :category_id,numericality:true
end
