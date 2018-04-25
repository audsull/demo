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
end
