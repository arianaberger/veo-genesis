class CreateBeings < ActiveRecord::Migration[5.2]
  def change
    create_table :beings do |t|
      t.string :name
      t.string :species
      t.integer :age
    end
  end
end
