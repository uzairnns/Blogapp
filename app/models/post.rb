# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
end
