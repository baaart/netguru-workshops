class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews
  
  validates :description, :price, :title, presence: true
  validates :price, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  
  def average_rating
    reviews.average(:rating)
  end
end
