class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :category
      t.string :model
      t.integer :color
      t.integer :brightness
      t.integer :being_id
    end
  end
end
