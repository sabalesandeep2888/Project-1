class Repository < ActiveRecord::Base
  has_many :commits
  has_many :author_repositories
  has_many :authors, :through => :author_repositories
  validates_presence_of :name
  validates_presence_of :rtype
end
