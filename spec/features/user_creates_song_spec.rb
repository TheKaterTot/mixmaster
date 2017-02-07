require "rails_helper"

feature "user creates song" do
  let!(:artist) { Fabricate(:artist) }
  scenario "they see page for the individual song" do
    song_title = "One Love"

    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content(song_title)
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
