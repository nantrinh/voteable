module Voteable
  extend ActiveSupport::Concern

  included do
    # run this at inclusion time
    has_many :votes, as: :voteable
  end

  def total_votes
    self.upvotes - self.downvotes  
  end

  def upvotes
    self.votes.where(vote: true).size
  end

  def downvotes
    self.votes.where(vote: false).size
  end
end
