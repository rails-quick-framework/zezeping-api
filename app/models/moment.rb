class Moment < ApplicationRecord
  include AASM
  belongs_to :store, counter_cache: true
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy

  enum status: { status_created: 0, status_expired: 1, status_blocked: 2 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  aasm :column => :status, :enum => true do
    state :status_created, :initial => true
    state :status_expired, :status_blocked
    # event
    event :status_expired do
      transitions :from => :status_created, :to => :status_expired
    end
    event :status_blocked do
      transitions :from => [:status_created, :status_expired], :to => :status_blocked
    end
  end
end
