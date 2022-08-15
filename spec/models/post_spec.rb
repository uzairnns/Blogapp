# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one_attached(:cover_picture) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:suggestions) }
    it { is_expected.to have_many(:reports) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end
end
