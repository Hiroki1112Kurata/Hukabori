class Report < ApplicationRecord

  belongs_to :user
  has_many :report_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  attachment :image


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # favoriteテーブルに、ユーザーIDが存在しているか？
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
    # bookmarkテーブルに、ユーザーIDが存在しているか？
  end

end
