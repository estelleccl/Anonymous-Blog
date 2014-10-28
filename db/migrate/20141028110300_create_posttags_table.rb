class CreatePosttagsTable < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.string :post_id
      t.string :title_id
      
      t.timestamps
    end  
  end
end