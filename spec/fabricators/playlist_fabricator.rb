Fabricator(:playlist) do
  name { Faker::Name.unique.name }
  songs { Fabricate.times(4, :song) }
end
