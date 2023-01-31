require 'rails_helper'

RSpec.describe User, type: :model do
  it { should define_enum_for(:role).with_values([:admin, :user]) }

  it { should validate_uniqueness_of(:email)}
  it { should validate_presence_of(:role)}

  it { should have_one_attached(:avatar) }
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:reacts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:received_follows).dependent(:destroy) }
  it { should have_many(:given_follows).dependent(:destroy) }
  it { should have_many(:followings) }
  it { should have_many(:followers) }
  it { should have_many(:send_notifications).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }
end
