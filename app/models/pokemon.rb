class Pokemon < ApplicationRecord
  belongs_to :trainer

  validates_presence_of :name
  
  def self.in_team_true
    where(in_team: true)
  end
end