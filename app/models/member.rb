class Member < ApplicationRecord
    validates :account, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true, length: { minimum: 4 }
    before_create :encrypt_password 

    private
    def encrypt_password
        self.password = Digest::SHA256.hexdigest("p#{self.password}k")
    end
end
