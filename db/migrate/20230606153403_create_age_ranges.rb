class CreateAgeRanges < ActiveRecord::Migration[7.0]
  def change
    create_table :age_ranges do |t|
      t.references :competition, null: false, foreign_key: true
      t.date :before
      t.date :after
      t.string :display_name

      t.timestamps
    end
  end
end
