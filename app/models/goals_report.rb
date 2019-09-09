class GoalsReport < ApplicationRecord
  belongs_to :goal_category
  belongs_to :location
  has_one_attached :report_img

  def self.same_location(location)
    if location.name == 'PA00'
      self.by_last_location
    else 
    self.where(location: location).last
    end
  end
  def self.by_last_location
    self.where(location: Location.last_location)
  end

  def self.import(files)
    files.each do |i|
      temp = GoalsReport.new(
        name:  i.original_filename,
        goal_category_id: 1,
        location_id: Location.find_by_number(i.original_filename.split('-')[0]).first.id,
      )   
      temp.report_img.attach(
        io: File.open(i.path), 
        filename: i, content_type: 'image/jpg'
        )
      temp.save!
    end
  end
end
