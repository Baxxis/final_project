# product class
class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  default_scope { where(is_active: true) }

  def self.search(search)
    where('name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%")
  end

  def self.get_by_category_id(category_id)
    where('category_id = ?', category_id)
  end

  mount_uploader :image_url, ProductUploader
end
