class Category < ApplicationRecord
    has_many :post_categories, dependent: :delete_all
    has_many :posts, through: :post_categories

    before_save :titleize_category

    def titleize_category 
        self.name = name.titleize
    end
end
