
class Product < ActiveRecord::Base

  mount_uploader :image_name, ProductUploader

end
