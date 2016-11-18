# product class
class Product < ApplicationRecord
  belongs_to :category

  def self.search(search)
    where('name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%")
  end

  mount_uploader :image_url, ProductUploader
end
