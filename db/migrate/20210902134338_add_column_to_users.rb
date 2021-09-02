class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :address, :string
    add_column :users, :job, :string
    add_column :users, :genre, :string
    add_column :users, :profile, :text
  end
end
