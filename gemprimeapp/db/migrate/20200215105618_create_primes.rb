class CreatePrimes < ActiveRecord::Migration[6.0]
  def change
    create_table :primes do |t|
      t.integer :primenum

      t.timestamps
    end
  end
end
