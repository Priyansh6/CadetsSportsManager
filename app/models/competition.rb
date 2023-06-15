class Competition < ApplicationRecord

  def start_time
    self.competition_date
  end

end
