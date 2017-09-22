require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { is_expected.to have_many(:wikis) }
  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

end
