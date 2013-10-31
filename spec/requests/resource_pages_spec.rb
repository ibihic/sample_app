require 'spec_helper'

describe "Resource pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "resource creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a resource" do
        expect { click_button "Add" }.not_to change(Resource, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'resource_content', with: "Example item" }
      it "should create a resource" do
        expect { click_button "Add" }.to change(Resource, :count).by(1)
      end
    end
  end

  describe "resource removal" do
    before { FactoryGirl.create(:resource, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a resource" do
        expect { click_link "delete" }.to change(Resource, :count).by(-1)
      end
    end
  end
end
