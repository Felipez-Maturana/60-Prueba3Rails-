class Genre < ApplicationRecord
  has_many :songs
  def to_s
    self.name
  end
end
