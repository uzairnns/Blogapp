# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:suggestions) }
    it { is_expected.to have_many(:reports) }
    it { is_expected.to have_many(:likings) }
    it { is_expected.to have_many(:replies) }
  end

  describe 'validations' do
    it { is_expected.to allow_content_types('image/png', 'image/jpeg').for(:avatar) }
  end
end
