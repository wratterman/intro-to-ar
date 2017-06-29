class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed
  validates_presence_of :name, :age, :total_winnings

  def self.total_winnings
    sum(:total_winnings)
  end

  def self.average_winnings
    average(:total_winnings).round
  end

  def age_in_months
    self.age * 12
  end
end
