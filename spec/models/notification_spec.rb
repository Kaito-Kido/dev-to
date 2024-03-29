require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should define_enum_for(:action) }

  it { should belong_to(:sender) }
  it { should belong_to(:receiver) }
end
