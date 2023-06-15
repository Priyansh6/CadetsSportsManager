class AddSeenToNotifcations < ActiveRecord::Migration[7.0]
  def change
    add_column :notifcations, :seen, :boolean
  end
end
