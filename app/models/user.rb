class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :thumbs, dependent: :destroy
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture
  has_one_attached :avatar
  #after_create :send_email

  ADMIN_PLAN_ID  = "plan_Gv7EsZpLeyn4eU"
  EDITOR_PLAN_ID = "plan_Gv7D7JkR5q8JfD"
  NORMAL_PLAN_ID = "plan_Gv7CQAARBRTR5l"

  ROLES = %w[admin normal editor].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  #validates_uniqueness_of :username
  #validates :username, presence: true,  format: { with: /\A[a-zA-Z_]+\z/,message: "only allows letters and _" }

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

=begin
  def send_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end
  #handle_asynchronously :send_email

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
=end

end
