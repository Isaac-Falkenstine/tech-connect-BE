class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      enable_extension :citext
      t.citext :city

      t.timestamps
    end
  end
end
