class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  delegate :name, to: :user, prefix: true, allow_nil: true

  validates :body, presence: true,
                   length: { minimum: 5 }

end
