class Report < ApplicationRecord

  belongs_to :user
  has_many :report_comments, dependent: :destroy
  attachment :image

end
