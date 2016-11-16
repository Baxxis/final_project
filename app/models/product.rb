class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :image_url, ProductUploader
end
