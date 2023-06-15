class CreateNotifcations < ActiveRecord::Migration[7.0]
  def change
    create_table :notifcations do |t|
      t.references :cadet, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :reg

      t.timestamps
    end
  end
end
