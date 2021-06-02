class User < ApplicationRecord
    validates :name, presence: true, length: {maximum:15}
    validates :email, presence: true, format: {with: /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/}
    validates :password, presence: true, length: {minimum: 8, maximum: 32}, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
    
    
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
end
