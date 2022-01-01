class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :account
  has_many :channel_affiliations
  has_many :users, through: :channel_affiliations
end
