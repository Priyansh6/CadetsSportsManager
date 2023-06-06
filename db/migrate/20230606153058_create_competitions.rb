class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :title
      t.date :competition_date
      t.string :location
      t.integer :minimum_age
      t.boolean :locked

      t.timestamps
    end
  end
end
