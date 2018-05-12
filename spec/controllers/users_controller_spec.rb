require 'rails_helper'
require 'clearance/rspec'
RSpec.describe UsersController do
  describe 'GET show' do
    user = User.new(email: 'lol@email.com', password: 'password')
    before do
      sign_in_as user
    end
    it 'assigns user as @user' do
      get :show
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST create' do
    let!(:blob) do
      { email: 'doug@email.com', password: 'password' }
    end

    it 'creates a new user' do
      post :create, params: { user: blob }
      expect(User.count).to be 1
    end
  end
end
