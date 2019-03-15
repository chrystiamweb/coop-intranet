 class Post < ApplicationRecord
  has_one_attached :image
  
  validate :selected_image?

    private

    def selected_image?
      errors.add(:base, 'Favor Selecionar capa do post.') unless image.attached?
    end
end
