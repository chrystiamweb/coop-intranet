class GoalsReport < ApplicationRecord
  belongs_to :goal_category
  belongs_to :location
  has_many_attached :report_img

  def self.import(files)
    files.each do |i|
      temp = GoalsReport.new(
        name: i.split(' - ')[0],
        goal_category_id: 1,
        location_id: 1,
      )   
      temp.report_img.attach(
        io: File.open(files), 
        filename: i, content_type: 'image/jpg'
        )
      temp.save!
    end
  end
end
