require 'spec_helper'


#validate email format 


describe User do
 before{ @user = User.new(username: 'sample', name: 'test', email: 'test@sample.com', password: 'foobar', password_confirmation: 'foobar') }
  subject {@user}

  it { should respond_to(:username) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

  describe "without a username" do
  		before { @user.username = "" }
  		it { should_not be_valid }
 
  end

  describe "without a name" do
  	before { @user.name = "" }
      it { should_not be_valid }
  end

  describe "without an email" do
  		before { @user.email = "" }
  		it { should_not be_valid }
  end

  describe "with empty password" do
  		before do
        @user = User.new(username: "username", name: "Example User", email: "user@example.com", password: "", password_confirmation: "")
      end
      it { should_not be_valid }
  end

  describe "with password less than 6 characters" do
      before { @user.password = "short" }
      before { @user.password_confirmation = "short" }
      it { should_not be_valid }
  end


  describe "with empty password confirmation" do
      before do
        @user = User.new(username: "username", name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "")
      end
      it { should_not be_valid }
  end

  describe "password does not match password confirmation" do
  		before { @user.password_confirmation = 'notmatch' }
  		it { should_not be_valid }
  end

  describe "uniqueness of email address" do
      before do
        @user.save
        @user2 = User.new(username: "username", name: "Example User", email: "test@sample.com", password: "foobar", password_confirmation: "foobar")
      end
        it "should not be valid" do
          expect(@user2).to_not be_valid
        end
    end

  # describe "with invalid email" do
  # 	it "should be invalid" do
  # 		@user.email = "abc@abccom"
  # 		expect(@user).to_not be_valid
  # 	end
  # 	it "should be invalid" do
  # 		@user.email = "abcatabc.com"
  # 		expect(@user).to_not be_valid
  # 	end
  # 	it "should be invalid" do
  # 		@user.email = "abc@@abc.com"
  # 		expect(@user).to_not be_valid
  # 	end
  # 	it "should be invalid" do
  # 		@user.email = "abc @abc.com"
  # 		expect(@user).to_not be_valid
  # 	end
  # end



end
