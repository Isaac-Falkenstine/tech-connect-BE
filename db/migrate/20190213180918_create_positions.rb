class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      enable_extension :citext
      t.citext :job_title

      t.timestamps
    end
  end
end
