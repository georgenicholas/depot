require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new(title:  "my book title",
                          description:  "yyy",
                          image_url:    "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
      product.errors[:price]

    product.price = 2
    product.valid?
  end

  test "product titles must be unique" do
    # fixtures :products
    product = Product.new(title:  products(:ruby).title,
                          description:  "yyy",
                          image_url:    "zzz.jpg")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
