class User < ApplicationRecord
PASSWORD_REGEX = /[0-9a-zA-Z]{6,}/
    has_one :profile, dependent: :destroy
    has_many :posts
    has_secure_password 

    before_save :downcase_email 
    validates :first_name, :last_name, :password_confirmation, presence: true
    validates :password, presence: true, format: {with: PASSWORD_REGEX, message: "Password Must be Atleast 6 Characters Long Without Any Special Characters!"}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid Email Address"}, presence: true, uniqueness: true

    private 
    def downcase_email 
        self.email = email.downcase
    end
end
