class User < ApplicationRecord
    PASSWORD_REGEX = /[0-9a-zA-Z]{6,}/

    has_one :profile, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_secure_password 

    before_save :downcase_email 
    validates :first_name, presence: true 
    validates :last_name, presence: true
    validates :password_confirmation, presence: true
    validates :password, presence: true, format: {with: PASSWORD_REGEX, message: "Must be Atleast 6 Characters Long Without Any Special Characters!"}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid"}, presence: true, uniqueness: true

    private 
    def downcase_email 
        self.email = email.downcase
    end
end
