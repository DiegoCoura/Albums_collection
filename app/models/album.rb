class Album < ApplicationRecord
  belongs_to :user
  has_many :artist

  validates :name, presence: true, length: { minimum: 3 }
  validates :year, numericality: { only_integer: true }, presence: true, inclusion: 1900..Date.current.year
end
