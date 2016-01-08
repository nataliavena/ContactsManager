class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
        t.string :first_name
        t.string :last_name
        t.string :email
        t.string :phone
        t.references :main

      t.timestamps null: false
    end
  end
end
