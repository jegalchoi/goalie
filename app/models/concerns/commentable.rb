module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :imageable, dependent: :destroy
  end
end