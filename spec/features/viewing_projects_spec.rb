require "rails_helper"

RSpec.feature "Users can view projects" do
  scenario "wirh rhe project details" do
    project = FactoryGirl.create(:project, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
  end
end