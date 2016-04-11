class Category < ActiveRecord::Base
	has_many :books

	validates :name,presence:true, uniqueness: true,
	format:{with:/\A[a-zA-Z]+\z/, message: "only allow letters"}
end
