class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  validates :time, presence:true, inclusion: {in: 0..23}
end
