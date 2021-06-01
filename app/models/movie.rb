class Movie < ApplicationRecord
  belongs_to :studio
  has_many :cast_members
  has_many :actors, through: :cast_members
end
