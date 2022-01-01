class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_user_account
  after_create :assign_locale

  has_many :account_affiliations
  has_many :accounts, through: :account_affiliations
  has_many :channel_affiliations
  has_many :channels, through: :channel_affiliations
  has_many :community_affiliations
  has_many :communities, through: :community_affiliations
  has_many :course_affiliations
  has_many :courses, through: :course_affiliations

  def name
    [first_name, last_name].compact.join(' ')
  end

  def create_user_account
    account = Account.new
    account.name = self.name
    account.save
    create_affiliation(account.id, self.id)
  end

  def create_affiliation(account_id, self_id)
    affiliation = AccountAffiliation.new
    affiliation.account_id = account_id
    affiliation.user_id = self_id
    affiliation.role = "user"
    affiliation.save
  end

  def assign_locale(&action)
    self.locale = I18n.default_locale
    self.save
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
end
