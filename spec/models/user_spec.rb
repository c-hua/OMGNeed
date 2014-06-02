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
  xit { should respond_to(:lists)}

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

  describe "with valid email" do
      it "should be valid" do
      valid_addresses = %w[user@user.com THE_user@some.com user@org.or.com]
      valid_addresses.each do |v_address|
        @user.email = v_address
        @user.should be_valid
      end
    end
  end


    describe "with invalid email" do
      it "should not be valid" do
      invalid_addresses = %w[user@user THE_user@some,com userorg.com]
      invalid_addresses.each do |in_address|
        @user.email = in_address
        @user.should_not be_valid
      end
    end
  end

  describe "with empty password" do
  		before { @user.password = @user.password_confirmation = nil }
      it { should_not be_valid }
  end

  describe "with password less than 6 characters" do
      before { @user.password = "short" }
      before { @user.password_confirmation = "short" }
      it { should_not be_valid }
  end


  describe "with empty password confirmation" do
     before { @user.password_confirmation = nil }
      it { should_not be_valid }
  end

  describe "password does not match password confirmation" do
  		before { @user.password_confirmation = 'notmatch' }
  		it { should_not be_valid }
  end

  describe "uniqueness of email address" do
      before do
        @user.save
        @user2 = @user.dup
        @user2.email = "test@sample.com"
      end
        it "should not be valid" do
          expect(@user2).to_not be_valid
        end
    end



end
