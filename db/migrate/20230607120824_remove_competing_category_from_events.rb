class RemoveCompetingCategoryFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :competing_category, :string
  end
end
