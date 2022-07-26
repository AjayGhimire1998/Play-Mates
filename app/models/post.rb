class Post < ApplicationRecord
    belongs_to :user
    has_many :post_categories
    has_many :categories, through: :post_categories, dependent: :destroy

    validates :caption, presence: true
    
    validates :post_file, presence: true
    validates :post_file, file_size: { less_than_or_equal_to: 200.megabytes, message: "Please Check File Size" }

    default_scope {order(updated_at: :desc)}

    accepts_nested_attributes_for :categories

    has_one_attached :post_file
    



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
      end
    end

end
