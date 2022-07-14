class Category < ApplicationRecord
    has_many :post_categories, dependent: :delete_all
    has_many :posts, through: :post_categories
    validates :name, uniqueness: true, allow_blank: false

    before_save :titleize_category

    def titleize_category 
        self.name = name.titleize
    end
end
