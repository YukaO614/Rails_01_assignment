class User < ApplicationRecord
    validates :name, presence: true, length: {maximum:15}
    validates :email, presence: true, format: {with: /([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+\.([a-zA-Z0-9\._-]+)/}
    validates :password, presence: true, format: {with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}/}
    
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
    has_many :comment_topics, through: :comments, source: 'topic'
    
end
