class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

    def ensure_not_referenced_by_any_line_item()
      unless line_items.empty?
        errors.add(:base, 'Line items present')
        throw :abort
      end
    end
end
