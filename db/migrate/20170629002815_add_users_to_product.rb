class AddUsersToProduct < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :products, :users
  end
end
