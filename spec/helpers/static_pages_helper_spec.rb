require 'rails_helper'


RSpec.describe StaticPagesHelper, type: :helper do
  
describe StaticPagesHelper do
  describe "use full title method" do
    it "show full title" do
      assert_equal full_title, 'Ruby on Rails Tutorial Sample App'
      assert_equal full_title("Help"), "Help | Ruby on Rails Tutorial Sample App" 
    end
  end
end


end
