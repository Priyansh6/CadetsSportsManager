class AddCompetingCategoryToAgeRange < ActiveRecord::Migration[7.0]
  def change
    add_column :age_ranges, :competing_category, :string
  end
end
