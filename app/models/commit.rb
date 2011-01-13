class Commit < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
  validates_presence_of :sha

  after_create :create_author_repository

  def create_author_repository
    AuthorRepository.create(:author => author, :repository => repository)
  end
end
