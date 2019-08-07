class ReportImageDatum < ApplicationRecord
  belongs_to :location
  belongs_to :report
  has_one_attached :image
end
