class AddHistoryToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :history, :integer
  end
end
