class CreateCadetRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :cadet_registrations do |t|
      t.references :cadet, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
