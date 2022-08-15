# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Liking, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:comment) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
  end
end
