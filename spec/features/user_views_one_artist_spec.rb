require "rails_helper"

feature "user sees individual artist" do
  let!(:artist) { Fabricate(:artist) }
  let!(:song) { Fabricate(:song, artist: artist)}
  scenario "they visit show" do
    visit artist_path(artist)
    click_on "View Songs"

    expect(page).to have_content(song.title)
    expect(page).to have_link song.title, href: song_path(song)
  end
end
