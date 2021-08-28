class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :theme
      t.text :content
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
