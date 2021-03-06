require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes the correct placeholder text' do
      expect(response.body).to include('The list of users')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1'
    end
    it 'renders the right template' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes the correct placeholder text' do
      expect(response.body).to include('The list of a specific user')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end
end
