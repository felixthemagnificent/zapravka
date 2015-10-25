class CreateGstations < ActiveRecord::Migration
  def change
    create_table :gstations do |t|
      t.text :name
      t.float :lat
      t.float :lon
      t.float :rating
      t.integer :queue
      t.integer :gasavail

      t.timestamps null: false
    end
  end
end
