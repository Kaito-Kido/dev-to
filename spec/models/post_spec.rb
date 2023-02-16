require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should define_enum_for(:status).with_values(%i[draft pending published declined]) }

  it { should validate_presence_of(:title) }

  context 'if not draft' do
    before { allow(subject).to receive(:not_draft?).and_return(true) }
    it { should validate_presence_of(:content) }
  end

  it { should belong_to(:user) }

  it { should have_many(:reacts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:tags).dependent(:destroy) }
  it { should have_many(:reacters) }
  it { should have_many(:categories) }
  it { should have_one_attached(:cover) }
  it { should have_rich_text(:content) }
end
