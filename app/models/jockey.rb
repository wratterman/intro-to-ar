class Jockey < ActiveRecord::Base
  has_many :horses
  validates :name, uniqueness: true
end
