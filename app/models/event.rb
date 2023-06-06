class Event < ApplicationRecord
  belongs_to :competition
  belongs_to :age_range
end
