class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed

  def self.total_winnings
    sum(:total_winnings).to_f.round(2)
  end

  def self.average_winngings
    average(:total_winnings).to_f.round(2)
  end
end
