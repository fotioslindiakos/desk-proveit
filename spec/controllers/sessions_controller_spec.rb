require 'spec_helper'

describe SessionsController, type: :controller do
  def login
    controller.should_receive(:require_login).and_return(true)
    session[:user_id] = user_id
    session[:oauth_secret] = oauth_secret
    session[:oauth_token] = oauth_token
  end

  describe "#destroy" do
    let(:user_id){ 1234 }
    let_double(:oauth_secret)
    let_double(:oauth_token)

    context "when logged in" do
      before do
        login
      end

      it "should log out" do
        get :destroy
        expect(session[:user_id]).to be_nil
        expect(session[:oauth_secret]).to be_nil
        expect(session[:oauth_token]).to be_nil

        response.should redirect_to(root_url)
      end
    end

    context "when not logged in" do
      it "should require login" do
        controller.should_receive(:require_login).and_return false

        get :destroy
        response.should redirect_to(root_url)
      end
    end
  end
end
