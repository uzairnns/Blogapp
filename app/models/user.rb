# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  acts_as_voter
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likings, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :visits, class_name: "Ahoy::Visit"

  validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes }, file_content_type:
                            { allow: ['image/jpeg', 'image/png', 'image/gif'] }
end
