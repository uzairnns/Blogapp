# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:parent).optional }
    it { is_expected.to have_one_attached(:cover_picture) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likings).dependent(:destroy) }
    it { is_expected.to have_many(:reports).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'comment validation' do
    context 'if picture not attached' do
      before { allow(subject).to receive(:check_picture).and_return(true) }
      it { should validate_presence_of(:body) }
    end

    context 'if pictre attached' do
      before { allow(subject).to receive(:check_picture).and_return(false) }
      it { should_not validate_presence_of(:body) }
    end
  end
end
