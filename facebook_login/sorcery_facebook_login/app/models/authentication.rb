class Authentication < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :provider, uniqueness: { scope: :uid }
  attr_accessible :user_id, :provider, :uid
end
