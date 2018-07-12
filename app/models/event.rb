class Event < ApplicationRecord
  def all_day_event?
    self.start == self.start.beginning_of_day && self.end == self.end.beginning_of_day ? true : false
  end
end
