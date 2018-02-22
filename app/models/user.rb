class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event
  has_many :comments

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :location, :state, presence: true

  before_save { self.email.downcase! }

  def events_in_my_state
    Event.all.where(state: self.state)
  end

  def events_not_in_my_state
    Event.all.where.not(state: self.state)
  end
end
