class AddCompetingCategoryToCadets < ActiveRecord::Migration[7.0]
  def change
    add_column :cadets, :competing_category, :string
  end
end
