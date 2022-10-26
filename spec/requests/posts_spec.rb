require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'index url' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'show url' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end
