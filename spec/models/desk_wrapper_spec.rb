require 'spec_helper'

describe DeskWrapper, type: :module do
  describe "constants" do
    [:API_KEY, :API_SECRET, :API_SITE].each do |const|
      it "should have an #{const}" do
        subject.should have_constant(const)
      end
    end
  end

  context "with mocked constants" do
    let_doubles(:api_key, :api_site, :api_secret)
    before do
      stub_api_consts
    end
    it "should have the right constant" do
      expect(DeskWrapper::API_KEY).to eq(api_key)
    end
    it "should have the right constant" do
      expect(DeskWrapper::API_SECRET).to eq(api_secret)
    end
    it "should have the right constant" do
      expect(DeskWrapper::API_SITE).to eq(api_site)
    end
  end
end
