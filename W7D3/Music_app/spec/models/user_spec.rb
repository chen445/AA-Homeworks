require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do 
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6)}
 end 

 subject(:user) { User.new(email:"hello@gmail.com", password: "123456")}
 describe "is_password?" do 
  it "verifies a password" do
    expect(user.is_password?("123456")).to be true
    expect(user.is_password?("166666")).to be false
  end 
  end 

  describe "reset_session_token!" do
    it"reset_session_token" do
      old_token = user.session_token 
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
    end 
    it "return new_session_token" do 
      expect(user.reset_session_token!).to eq(user.session_token)
    end   
  end 

  describe "::find_by_credentials" do 
    it "return nil with wrong password" do 
      expect(User.find_by_credentials("hello@gmail.com","6666655")).to eq(nil)
    end
    it "return user with correct password" do 
      expect(User.find_by_credentials("hello@gmail.com","123456")).to eq(user)
    end 
  end
end


