require 'spec_helper'

describe ApplicationController, type: :controller do
  let_doubles(:user_id, :oauth_secret, :oauth_token, :cur_user)

  def existing_session
    session[:user_id] = user_id
    session[:oauth_secret] = oauth_secret
    session[:oauth_token] = oauth_token
  end

  describe '#current_user' do
    context "with an existing session" do
      before do
        existing_session
      end

      it "look for a current user in the database" do
        expect(User).to receive(:find).with(user_id).once.and_return(cur_user)

        expect(subject.current_user) == cur_user
      end

      it "use a cached result the if @current_user is set" do
        # Run this once to cache the value
        expect(User).to receive(:find).with(user_id).once.and_return(cur_user)
        expect(subject.current_user) == cur_user

        expect(User).to receive(:find).with(user_id).never

        expect(subject.current_user) == cur_user
      end

      it "should return nil if we can't find a user" do
        expect(User).to receive(:find).with(user_id).and_raise(ActiveRecord::RecordNotFound)

        expect(subject.current_user).to be_nil
      end
    end

    context "without an existing session" do
      it "should not attempt to find a user" do
        expect(User).to receive(:find).never
        expect(subject.current_user).to be_nil
      end
    end
  end

  describe '#desk' do
    before do
      existing_session
    end

    let(:opts){{
      token: oauth_token,
      token_secret: oauth_secret
    }}
    let_double(:wrapper)

    context "on the first run" do
      it "should create a new DeskWrapper" do
        expect(DeskWrapper::Client).to receive(:new).with(opts).and_return(wrapper)

        expect(subject.desk) == wrapper
      end
    end

    context "on the second run" do
      it "should not create a new DeskWrapper" do
        # Run this once to cache the value
        expect(DeskWrapper::Client).to receive(:new).with(opts).and_return(wrapper)
        expect(subject.desk) == wrapper

        expect(DeskWrapper::Client).to receive(:new).never

        expect(subject.desk) == wrapper
      end
    end
  end

  describe '#require_login' do
    context "with a current user" do
      it "should not redirect to login" do
        expect(subject).to receive(:current_user).and_return(cur_user)
        expect(subject).to receive(:redirect_to).never

        subject.require_login
      end
    end

    context "without a current user" do
      it "should redirect to login" do
        expect(subject).to receive(:current_user).and_return(nil)
        expect(subject).to receive(:redirect_to).once.with(login_url)

        subject.require_login
      end
    end
  end
end
