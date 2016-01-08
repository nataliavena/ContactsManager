class AddsPhotosToContacts < ActiveRecord::Migration
  def change
    add_column :mains, :image_uid,  :string
  end
end
