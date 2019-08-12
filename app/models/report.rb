class Report < ApplicationRecord
  belongs_to :report_type
  has_one_attached :file
  has_many :report_image_data, dependent: :destroy

  def add_images_to_report(params)    
    params[:images].each do |image|
      report_data =  ReportImageDatum.new(   
        name:  image.original_filename,       
        report_id: self.id,
        location_id: Location.find_by_number(image.original_filename.split('-')[0]).first.id
      )
      report_data.image.attach(
        io: File.open(image.path), 
        filename: image, content_type: 'image/jpg'
      )
      report_data.save!
    end    
  end

  def self.last_by_type(type)
    self.where(report_type_id: type).last
  end

  def self.by_type(type)        
    self.where(report_type_id: type)
  end

  def self.distinct_type
    self.select(:report_type_id).order(report_type_id: :desc).distinct
  end

  def self.last_per_type
    ids = self.group(:report_type).order(report_type_id: :desc).maximum(:id).values
    self.find(ids)
  end
  def self.order_by_img
    joins(:report => :report_image_datum).order("report_image_datum.location_id")
  end
end
