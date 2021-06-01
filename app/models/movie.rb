class Movie < ApplicationRecord
  belongs_to :studio
  has_many :cast_members
end
