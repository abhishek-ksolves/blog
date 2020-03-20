class Article < ApplicationRecord
  paginates_per 4
  belongs_to :user
  has_many :thumbs, dependent: :destroy
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

=begin
  def last_5_comments
    comments.order("updated_at DESC").limit(5)
  end

  def last_5_eager_comments
    comments
  end
=end
end
