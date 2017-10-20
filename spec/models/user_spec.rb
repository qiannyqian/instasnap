require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end

  describe "associations" do
    it { should have_many(:photos) }
    it { should have_many(:likes) }
  end

  describe User, "#initials" do
    let(:user)  { User.create(username: "Hui Qian", email: "huiqian@email.com", password: "1234") }

    it "returns user initials" do
      expect(user.initials).to eq 'HQ'
    end
  end
end
