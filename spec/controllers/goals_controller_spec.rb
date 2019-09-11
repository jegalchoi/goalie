require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to new goal page" do
        #post :create, params: { goal: { title: "testgoal", details: "gibberish", visibility: "true", status: "false", cheers: 0, user_id: 1 } }
        #expect(response).to redirect_to(goal_url(Goal.find_by(title: "testgoal").id))
      end
    end

    context "with invalid params" do
      it "redirects to new template" do
        #post :create, params: { user: { username: "test1", email: "email@email.com", password: "password", session_token: SecureRandom.urlsafe_base64(16) } }
        #post :create, params: { goal: { title: "testgoal", user_id: 1 } }
        #expect(response).to redirect_to(user_url(User.find_by(id: 1)))
      end
    end
  end

  describe "POST #destroy" do
    it "redirects to user page" do

    end
  end

end