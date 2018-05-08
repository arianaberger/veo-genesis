class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :type
      t.string :model
      t.string :color
      t.string :size
    end
  end
end
