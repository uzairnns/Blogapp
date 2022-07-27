# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id, dependent: :destroy
  has_many :likings, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_one_attached :cover_picture
  validates :comment, presence: true, if: :check_picture

  def check_picture
    cover_picture.attached? == false
  end
end
