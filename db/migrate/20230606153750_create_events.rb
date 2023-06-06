class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :competition, null: false, foreign_key: true
      t.references :age_range, null: false, foreign_key: true
      t.string :title
      t.string :competing_category

      t.timestamps
    end
  end
end
