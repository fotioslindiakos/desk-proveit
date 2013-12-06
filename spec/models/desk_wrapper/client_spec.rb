require 'spec_helper'

describe DeskWrapper::Client, type: :class do
  let_doubles(:api_key, :api_site, :api_secret, :client)
  let(:defaults){{
    consumer_key: api_key,
    consumer_secret: api_secret,
  }}

  before do
    stub_api_consts
  end

  describe "#initialize" do
    context "with no options" do
      it "should raise an error" do
        expect{subject.new}.to raise_error(ArgumentError)
      end
    end

    describe "with options" do
      # Default opts
      let(:opts){{}}
      before do
        expect_any_instance_of(DeskWrapper::Client).to receive(:build_client).and_return(client)
      end
      subject{ DeskWrapper::Client.new(opts) }

      describe "#options" do
        context "with empty options" do
          let(:opts){{}}

          its(:options){ should eq(defaults) }
        end

        context "with unique options" do
          let_double(:foo)
          let(:opts){{foo: foo}}

          its(:options){ should include(defaults)}
          its(:options){ should include(opts)}
        end

        context "with overriding options" do
          let_double(:foo)
          let(:key){ defaults.keys.first}
          let(:opts){{key => foo}}

          it "should merge options" do
            cur_opts = subject.options
            old_val = defaults[key]
            cur_opts[key].should eq(foo)
            cur_opts[key].should_not eq(old_val)

            defaults.select{|k,v| k != key}.each do |k,v|
              cur_opts[k].should eq(v)
            end
          end
        end
      end

      describe "#client" do
        its(:client){should be(client)}
      end
    end

    describe "API checks" do
      let_doubles(:options, :client)
      let(:opts){{}}
      subject{ DeskWrapper::Client.new(opts) }
    end
  end
end
