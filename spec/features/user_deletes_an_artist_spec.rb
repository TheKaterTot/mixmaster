require "rails_helper"

feature "user deletes an artist" do
  let!(:artist) { Fabricate(:artist) }
  scenario "user visits show page" do
    visit artist_path(artist)
    expect{ click_on "Delete" }.to change{Artist.count}.from(1).to(0)
    expect(current_path).to eq(artists_path)
  end
end
