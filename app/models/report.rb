class Report < ApplicationRecord

  belongs_to :user
  has_many :report_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  attr_accessor :name
  # tagテーブルのnameカラムを紐づける

  attachment :image
  enum status: { checking: 0, publiced: 1, privated: 2 }

  validates :title, presence: true
  validates :content, presence: true
  validates :learning, presence: true
  validates :action, presence: true
  validates :admin_comment, presence: true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # favoriteテーブルに、ユーザーIDが存在しているか？
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
    # bookmarkテーブルに、ユーザーIDが存在しているか？
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end

end
