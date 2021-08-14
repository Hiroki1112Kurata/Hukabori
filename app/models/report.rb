class Report < ApplicationRecord

  belongs_to :user
  has_many :report_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # favoriteテーブルに、ユーザーIDが存在しているか？
  end

end
