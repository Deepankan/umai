class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :value, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  after_save :update_post

  def update_post
    self.post.update_attributes(avg_rating: self.post.avg_rating )
  end
end
