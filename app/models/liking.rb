# frozen_string_literal: true

class Liking < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :comment
  belongs_to :user
end
