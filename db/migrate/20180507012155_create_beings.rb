class CreateBeings < ActiveRecord::Migration[5.2]
  def change
    create_table :beings do |t|
      t.string :name
      t.string :species
      t.string :age
      t.integer :user_id
    end
  end
end
