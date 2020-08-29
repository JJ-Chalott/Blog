class Category < ApplicationRecord
    has_many :categoryarticles
    has_many :articles, through: :categoryarticles
end
