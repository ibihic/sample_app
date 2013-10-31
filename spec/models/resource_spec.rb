require 'spec_helper'

describe Resource do

    let(:user) { FactoryGirl.create(:user) }
    before { @resource = Resource.new(content: "Example item", user_id: user.id) }

    subject { @resource }

    it { should respond_to(:content) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should eq user }

    it { should be_valid }

    describe "when user_id is not present" do
        before { @resource.user_id  = nil }
        it { should_not be_valid }
    end

    describe "with blank content" do
        before { @resource.content = " " }
        it { should_not be_valid }
    end

    describe "with content that is too long" do
        before { @resource.content = "a" * 141 }
        it { should_not be_valid }
    end
end
