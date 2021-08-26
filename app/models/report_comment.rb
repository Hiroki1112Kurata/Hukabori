class ReportComment < ApplicationRecord

  belongs_to :user
  belongs_to :report

  validates :comment, presence: true
end
