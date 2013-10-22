# Note all static pages could follow simple structure of Home.
# Left Help, About, Contact in different formats to see different options and meanings

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
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      click_link "About"
      expect(page).to have_content('About Us')
    end

    it "should have the right title 'About Us'" do
      visit about_path
      click_link "About"
      expect(page).to have_title("Sample App | About Us")
    end
  end

    describe "Contact page" do

    it "should have the content 'Contact Us'" do
      visit contact_path
      click_link "Contact"
      expect(page).to have_content('Contact Us')
    end

    it "should have the right title 'Contact Us'" do
      visit contact_path
      click_link "Contact"
      expect(page).to have_title("Sample App | Contact Us")
    end
  end
end
