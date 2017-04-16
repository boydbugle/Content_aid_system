class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email
    has_many :questions, dependent: :destroy
    has_many :replys, dependent: :destroy
end
