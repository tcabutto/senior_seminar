class Personnel < ApplicationRecord
  has_one :account, as: :accountable
  #has_many :comment_reports, as: :reportable
  has_many :comments, as: :commentable
  #has_many :event_reports
  #has_many :deal_reports



  enum rank: ["E-1", "E-2", "E-3","E-4","E-5","E-6","E-7","E-8","E-9","O-1",
    "O-2","O-3","O-4","O-5","O-6","O-7","O-8","O-9","O-10","W-1","W-2","W-3","W-4","W-5"]
  enum branch: ["Air Force", "Army", "Coast Guard","Marine Corps","Navy"]

  validates_uniqueness_of :username, on: :update
  validates :username, presence: true, on: :update
  validates :rank, presence: true, on: :update
  validates :branch, presence: true, on: :update

  mount_uploader :image_url, PictureUploader
end
