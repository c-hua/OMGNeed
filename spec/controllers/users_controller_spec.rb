require 'spec_helper'

describe UsersController do
  let :valid_attributes do
   { username: 'sample',
    name: 'user',
    email: 'sample@sample.com',
    password: 'sample',
    password_confirmation: 'sample' }
  end



  describe "GET 'show'" do
    before do
      @user = User.create! valid_attributes
      get :show, id: @user.id
    end

    it "should render the show template" do
      expect(response).to render_template :show
    end



    it "should return http success" do
      expect(response).to be_success
    end

    it "should assign the requested user as @user" do
      expect(assigns(:user)).to eq(@user)
    end

  end

  describe "GET 'edit'" do
    before do
      @user = User.create! valid_attributes
      get :edit, id: @user.id
    end

    it "should render the edit template" do
      expect(response).to render_template :edit
    end



    it "should return http success" do
      expect(response).to be_success
    end

    it "should assign the requested user as @user" do
      expect(assigns(:user)).to eq(@user)
    end

  end


  describe "Get 'new'" do
    before { get :new }
    it "should render the new template" do
      expect(response).to render_template :new


    end
    it "should succeed" do
      expect(response).to be_success
    end
    it "should assign a user to be a new user" do
      expect(assigns(:user)).to be_a_new(User)
    end
  end
 
 describe "Post create with valid attributes" do

    it "should save the user to users" do
      expect do 
        post :create, user: valid_attributes
      end.to change(User, :count).by(1)

    end

    xit "should redirect to newsfeed page" do
    end 

    it "should set a current user status" do
      expect(assigns(:current_user)).to eq()
    end
 end



end
