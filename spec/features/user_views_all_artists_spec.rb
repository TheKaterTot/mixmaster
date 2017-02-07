require "rails_helper"

feature "user views all artists" do
  scenario "they visit index" do
    artist_1 = Fabricate(:artist)
    artist_2 = Fabricate(:artist)
    
    visit artists_path

    expect(page).to have_content(artist_1.name)
    expect(page).to have_content(artist_2.name)
  end
end
