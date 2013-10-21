require 'spec_helper'

describe "Static pages" do

  subject {page}

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title (' | Home') }
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the right title 'Help'" do
      visit help_path
      expect(page).to have_title("Sample App | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the right title 'About Us'" do
      visit about_path
      expect(page).to have_title("Sample App | About Us")
    end
  end

    describe "Contact page" do

    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content('Contact Us')
    end

    it "should have the right title 'Contact Us'" do
      visit contact_path
      expect(page).to have_title("Sample App | Contact Us")
    end
  end
end
