require 'spec_helper'

describe "UserPages" do
  subject { page }
  
  describe "signup page" do
    before { visit users_new_path }
    
    it { should have_content('Sign up') }
    it { should have_title(full_title("Sign up")) }
  end
end
