class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_many :games, dependent: :destroy
  has_and_belongs_to_many :attended_events, class_name: 'Game'
  has_and_belongs_to_many :gametypes
  acts_as_token_authenticatable
  acts_as_followable
  acts_as_follower
  validates :name, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   def skip_confirmation!
     self.confirmed_at = Time.now
   end

end
