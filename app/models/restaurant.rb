class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def has_been_reviewed_by(current_user, restaurant)
    @reviews = Review.where(:user_id => current_user.id, :restaurant_id => restaurant.id )
p    @allreviews = Review.all
    @reviews.empty? ? false : true
  end
end
