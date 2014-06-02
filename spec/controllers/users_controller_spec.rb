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


  describe "POST create" do
    describe "with valid attribute" do 
      it "should save the user to the database" do
        expect do
          post :create, user: valid_attributes
        end.to change(User,:count).by(1)
      end

      xit "should redirect user to '#'" do
        expect(response).to render_template '#'
      end
    end


    describe "with invalid attribute" do 
      let :invalid_attributes do
       { username: nil,
        name: nil,
        email: nil,
        password: nil,
        password_confirmation: nil }
      end

      it "should not save the user to the database" do
        expect do
          post :create, user: invalid_attributes
        end.to_not change(User,:count).by(1)
      end

      it "should render the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "Put update" do
    before do
      @user.create! valid_attributes
    end

    descirbe "with successful update" do
      let :update_attributes do
        {
          name: 'changename'
        }
      end

      before do 
        put :update, id: @user.id, user: update_attributes
      end

      it "should update the users' data" do
        expect(@user.reload.name).to eq('changename')
      end

      it "should redirect to '#'" do
        expect(response).to render_template '#'
      end
    end

    describe "with unsuccesful update" do
       let :invalid_update_attributes do
        {
          name: 'changename'
        }
      end
      before do 
        put :update, id: @user.id, user: invalid_update_attributes
      end
    end







  end



 
end
