class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :status
      t.datetime :meeting_date
      t.string :meeting_location
      t.integer :user_id
      t.integer :connection_id

      t.timestamps
    end
  end
end
