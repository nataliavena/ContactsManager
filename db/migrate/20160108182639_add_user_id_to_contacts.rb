class AddUserIdToContacts < ActiveRecord::Migration
  def change
    add_column :mains, :user_id, :integer
  end
end
