class Post < ApplicationRecord
    belongs_to :user
    has_many :post_categories
    has_many :categories, through: :post_categories, dependent: :destroy

    validates :caption, presence: true
    validates :video, presence: true
  
    # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    has_attached_file :video, :styles => {
      :medium => { :geometry => "640x480", :format => 'flv' },
      :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
    }, :processors => [:transcoder]

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
