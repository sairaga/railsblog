class Post < ActiveRecord::Base
	belongs_to :users, :class_name => "User"
end
