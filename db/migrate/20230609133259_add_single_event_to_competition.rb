class AddSingleEventToCompetition < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :single_event, :boolean
  end
end
