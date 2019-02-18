class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :status
      t.datetime :meeting_date
      t.string :meeting_location
      t.references :user, foreign_key: true
      t.integer :connection_id

      t.timestamps
    end
  end
end
