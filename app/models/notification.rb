class Notification < ApplicationRecord
  belongs_to :cadet
  belongs_to :event
end
