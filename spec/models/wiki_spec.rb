require 'rails_helper'

RSpec.describe Wiki, type: :model do

  let(:user) { User.create!(email: "newUser@email.com", password: "newPassword") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user) }

  describe "attributes" do
    it "has a title, body, private, and user attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user)
    end
  end

end
