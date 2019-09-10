require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "GET #index" do
    it "renders the index template" do 
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new new template" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the home page" do
        post :create, params: { user: { username: "test1", email: "email@email.com", password: "password", session_token: SecureRandom.urlsafe_base64(16) } }
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { user: { username: "test1" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      User.create!(username: "test1", email: "email@email.com", password: "password", session_token: SecureRandom.urlsafe_base64(16))
      get :show, params: { id: User.first.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    context "if the user does not exist" do
      it "redirects to the index template" do
        begin
          get :show, params: { id: -1 }
        rescue
          ActiveRecord::RecordNotFound
        end

        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end

end
