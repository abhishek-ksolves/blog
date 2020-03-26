class Comment < ApplicationRecord
  #for testing
  validates :commenter, presence: true
  validates :body, presence: true

  belongs_to :article
  belongs_to :user
end
