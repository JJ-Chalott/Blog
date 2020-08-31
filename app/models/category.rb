class Category < ApplicationRecord
    has_many :category_articles, dependent: :destroy
    has_many :articles, through: :category_articles
end
