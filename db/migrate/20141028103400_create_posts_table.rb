class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.text :content, null:false
      t.string :author
      
      t.timestamps
    end   
  end
end

