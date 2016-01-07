class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
    t.string :image
    t.string :first_name
    t.string :last_name
    t.string :email
    t.string :phone

      t.timestamps null: false
    end
  end
end
