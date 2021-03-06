class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators
  has_many :collaborating_wikis, through: :collaborators, source: :wiki
  accepts_nested_attributes_for :collaborators

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :confirmable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role

  def set_default_role
    self.role ||= :standard
  end

  def self.default_amount
     1500
  end


end
