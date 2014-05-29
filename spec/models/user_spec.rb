require 'spec_helper'

describe User do
 before{ @user = User.new(username: 'sample', name: 'test', email: 'test@sample.com', password: 'sample', password_confirmation: 'sample') }
  subject {@user}

  it { should respond_to(:username) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

  describe "without a username" do
  	it "should not be valid" do
  		@user.username = "" 
  		expect(@user).to_not be_valid
  	end
  end

  describe "without a name" do
  	it "should not be valid" do
  		@user.name = ""
  		expect(@user).to_not be_valid
  	end
  end

  describe "without an email" do
  	it "should not be valid" do
  		@user.email = ""
  		expect(@user).to_not be_valid
  	end
  end

  # describe "with empty password" do
  # 	it "should not be valid" do
  # 		@user.password = ""
  # 		expect(@user).to_not be_valid
  # 	end
  # end

  describe "password does not match password confirmation" do
  	it "should not be valid" do
  		@user.password = 'foo'
  		@user.password_confirmation = 'bar'
  		expect(@user).to_not be_valid
  	end
  end

  describe "password match password confirmation" do
  	it "should be valid" do
  		@user.password = 'foo'
  		@user.password_confirmation = 'foo'
  		expect(@user).to be_valid
  	end
  end

  describe "with invalid email" do
  	it "should be invalid" do
  		@user.email = "abc@abccom"
  		expect(@user).to_not be_valid
  	end
  	it "should be invalid" do
  		@user.email = "abcatabc.com"
  		expect(@user).to_not be_valid
  	end
  	it "should be invalid" do
  		@user.email = "abc@@abc.com"
  		expect(@user).to_not be_valid
  	end
  	it "should be invalid" do
  		@user.email = "abc @abc.com"
  		expect(@user).to_not be_valid
  	end
  end



end
