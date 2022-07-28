# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_one_attached :cover_picture
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
