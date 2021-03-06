class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      enable_extension :citext
      t.citext :name
      t.string :password_digest
      t.string :email
      t.bigint :phone_number
      t.string :github
      t.string :linkedin
      t.string :bio
      t.string :api_key
      t.string :photo
      t.references :location, foreign_key: true
      t.references :employer, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
