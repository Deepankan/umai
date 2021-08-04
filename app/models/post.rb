class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings

  validates :title, presence: true
  validates :content, presence: true

  scope :sort_by_ratings_desc, -> { self.order('avg_rating') }

  def avg_rating
    self.ratings.average(:value)
  end
end
