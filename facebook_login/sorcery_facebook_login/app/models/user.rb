class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :email, presence: true, uniqueness: true

  def has_linked_facebook?
    authentications.where(provider: 'facebook').present?
  end
  
end
