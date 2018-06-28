class Docfile < ApplicationRecord
  has_one_attached :doc_file
  belongs_to :file_type
end
