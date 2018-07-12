class Event < ApplicationRecord
  def all_day_event?
    self.start == self.start.beginning_of_day && self.end == self.end.midnight ? true : false
  end
end
