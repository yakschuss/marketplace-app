require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "validations on a new admin" do
    describe "new admin" do

      it "should be invalid if username is empty" do
        new_user = Admin.new(username: "", password: "password", password_confirmation: "password")
        expect(new_user).to_not be_valid
      end

      it "should be invalid if the password is too short" do
        new_user = Admin.new(username: "JackS", password: "pass", password_confirmation: "pass")
        expect(new_user).to_not be_valid
      end

      it "should be invalid if the passwords don't match" do
        new_user = Admin.new(username: "JackS", password: "apass", password_confirmation: "thepass")
        expect(new_user).to_not be_valid
      end

    end
  end



end
