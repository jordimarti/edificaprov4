class Article < ApplicationRecord
  belongs_to :channel

  validates :title, presence: true
end
