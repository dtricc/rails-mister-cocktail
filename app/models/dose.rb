class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, uniqueness: true, presence: true
  validates :cocktail, :ingredient, presence: true
end
