class Post < ApplicationRecord
    belongs_to :user
    has_many :post_categories
    has_many :categories, through: :post_categories, dependent: :destroy

    validates :caption, presence: true
    validates :image, presence: true 
  
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
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

    def self.by_category(category_id)
      if category_id
        self.includes(:categories).where(categories: { id: category_id})
      else
        self.all
      end
    end
end
