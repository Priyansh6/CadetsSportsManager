class RenameNotifcationsToNotifications < ActiveRecord::Migration[7.0]
  def change
    rename_table :notifcations, :notifications
  end
end
