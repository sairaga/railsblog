class AddUsersRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :users, index: true
  end
end
