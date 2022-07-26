# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :suggestion
  belongs_to :user
end
