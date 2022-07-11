class Post < ApplicationRecord
    belongs_to :user
    has_many :post_categories
    has_many :categories, through: :post_categories
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    accepts_nested_attributes_for :categories
    
    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attr|
          if category_attr["name"].present? 
            category = Category.find_or_create_by(category_attr)
            self.categories << category
          end
        end
    end
end
