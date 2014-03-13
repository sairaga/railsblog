class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :comments, :posts, index: true
      t.references :comments, :users, index: true
      t.timestamps
    end
  end
end
