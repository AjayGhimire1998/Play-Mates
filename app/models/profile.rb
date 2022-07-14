class Profile < ApplicationRecord
    belongs_to :user

    validates :username, presence: true
    validates :avatar, presence: true
    validates :bio, presence: true
    validates :cover, presence: true

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

    def self.search_by_username(search_text)
        if search_text 
            self.where("lower(username) LIKE :search", search: "%#{search_text}%")
        else
            self.all
        end
    end
end
