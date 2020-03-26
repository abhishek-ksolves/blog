class Article < ApplicationRecord
  #for testing
  validates :text, presence: true

  validates :title, presence: true, length: { minimum: 5 }
  paginates_per 4
  has_many :thumbs, dependent: :destroy
  #has_one :picture, as: :imageable
  has_many :comments, dependent: :destroy
  #add when testing is done
  #accepts_nested_attributes_for :picture
  belongs_to :user

#method for last_comments
=begin
  def last_5_comments
    comments.order("updated_at DESC").limit(5)
  end

  def last_5_eager_comments
    comments
  end
=end

end
