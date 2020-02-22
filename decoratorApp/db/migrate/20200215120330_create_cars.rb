class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :firstname
      t.string :lastname
      t.string :manufacturer
      t.decimal :cost
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
