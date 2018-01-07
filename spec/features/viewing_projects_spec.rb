require "rails_helper"

RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryBot.create(:project, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
  end
end
