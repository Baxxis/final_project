# product class
class Product < ApplicationRecord
  belongs_to :category

  def self.search(search)
    where('name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%")
  end

  def self.get_by_category_id(category_id)
    where('category_id = ?', category_id)
  end

  mount_uploader :image_url, ProductUploader
end
