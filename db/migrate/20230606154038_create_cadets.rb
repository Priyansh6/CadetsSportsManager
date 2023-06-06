class CreateCadets < ActiveRecord::Migration[7.0]
  def change
    create_table :cadets do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :cid
      t.string :rank
      t.references :squadron, null: false, foreign_key: true

      t.timestamps
    end
  end
end
