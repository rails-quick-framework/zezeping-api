class Comment < ApplicationRecord
  mount_uploader :tmp_avatar, ImageUploader

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true
  has_many :attachment_images, as: :owner, dependent: :destroy

  after_commit :update_commentable, on: :create

  private

  def update_commentable
    if commentable.is_a? Store
      store = commentable
      store.update({
        rank: store.comments.average(:rank) || 0,
        per_expense: store.comments.average(:per_expense) || 0
      })
      store.store_detail.update({
        rank_taste: store.comments.average(:rank_taste) || 0,
        rank_env: store.comments.average(:rank_env) || 0,
        rank_service: store.comments.average(:rank_service) || 0
      })
    end
  end
end
