# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:suggestions).dependent(:destroy) }
    it { is_expected.to have_many(:reports).dependent(:destroy) }
    it { is_expected.to have_many(:likings).dependent(:destroy) }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
  end

  describe '#avatar' do
    subject { create(:user).avatar }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
