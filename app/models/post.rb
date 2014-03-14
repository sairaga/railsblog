class Post < ActiveRecord::Base
	has_many  :comments, :class_name =>"Comment"
	belongs_to :users, :class_name => "User"
end
