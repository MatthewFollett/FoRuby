require 'spec_helper'

describe "User pages" do 

  subject { page }
	
  describe "index" do 

    let(:user) { FactoryGirl.create(:user) }

    before(:each) do 
      sign_in user
      visit users_path
    end 

    it { should have_selector('title', text: 'Users') }
    it { should have_selector('h1',    text: 'Users') }
  end 

  describe "signup page" do 

    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end 
	
	describe "profile page" do 
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector('title', text: user.name) }
	end
	
	 describe "signup" do 

    before { visit signup_path }

    let(:submit) { "Create my account" }
    describe "with invalid information" do 
      it "should not create a user" do 
        expect { click_button submit }.not_to change(User, :count)
      end 
			
			describe "after submission" do 
				before { click_button submit }

				it { should have_selector('title', text: 'Sign up') }
				it { should have_content('error') }
			end 
    end 

    describe "with valid information" do 
      before do 
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end 

      it "should create a user" do 
        expect { click_button submit }.to change(User, :count).by(1)
      end 
			
			describe "after saving the user" do 
				before { click_button submit }
				let(:user) { User.find_by_email('user@example.com') }

				it { should have_selector('title', text: user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
				it { should have_link('Sign out') }
				
			describe "followed by signout" do 
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
			end 
    end
  end 
	
	describe "edit" do
		let(:user) {FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end
		
		describe "with invalid information" do
			before { click_button "Update User" }
			it { should have_content('error') }
		end
		
		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_email) {"new@example.com"}
			before do
				fill_in "Name", 						with: new_name
				fill_in "Email", 						with: new_email
				fill_in "Password", 				with: user.password
				fill_in "Confirm Password", with: user.password
				click_button "Update User"
			end
			
			it { should have_selector('title', text: new_name) }
			it { should have_selector('div.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { user.reload.name.should == new_name }
			specify { user.reload.email.should == new_email }
		end
	end
	
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:m1) { FactoryGirl.create(:message_post, author: user, content: "Foo") }
		let!(:m2) { FactoryGirl.create(:message_post, author: user, content: "Bar") }
		
		before { visit user_path(user) }
		
		it { should have_selector('title', text: user.name) }
	
		describe "message posts" do
			it { should have_content(m1.content) }
			it { should have_content(m2.content) }
			it { should have_content(user.message_posts.count) }
		end
	end
end