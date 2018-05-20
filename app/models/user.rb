class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { minimum: 2 }
  enum gender: {male: 0, female: 1}

  # User::Roles
  # The available roles
  Roles = [ :instructor , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  mount_uploader :avatar, AvatarUploader

  acts_as_voter
  acts_as_commontator
  
  has_many :courses
  has_many :lectures
  has_and_belongs_to_many :lectures
end
