class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      enable_extension :citext
      t.citext :name
      t.string :site_url

      t.timestamps
    end
  end
end
