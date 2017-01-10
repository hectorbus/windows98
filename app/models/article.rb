class Article < ApplicationRecord
  belongs_to :user

  has_many :comments

  delegate :name, to: :user, prefix: true, allow_nil: true

  validates :title, presence: true,
                    length: { minimum: 5 }

end
