class Lecture < ApplicationRecord
    validates :content, presence: true
    validates :attachment, presence: true
    validates :title, presence: true, length: { minimum: 2 }
    
    mount_uploader :attachment, AttachmentUploader

    acts_as_votable
    acts_as_commontable

    belongs_to :user
    belongs_to :course
    has_and_belongs_to_many :users
end
