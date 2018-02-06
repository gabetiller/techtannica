class Wiki < ApplicationRecord

  belongs_to :user
  has_many :collaborators
  has_many :collaborating_users, through: :collaborators, source: :user
  accepts_nested_attributes_for :collaborators

  validates :title, presence: true
  validates :body, presence: true


def self.public
  Wiki.where(private: false)
end


end
