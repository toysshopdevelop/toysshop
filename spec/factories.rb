FactoryGirl.define do
  factory :category do
    title 'Category for test'
  end

  factory :product do
    title 'some product'
    article '111-223'
    image_name 'some_picture.jpg'
    price '1000.5'
  end
end
