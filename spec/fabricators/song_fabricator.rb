Fabricator(:song) do
  title { Faker::Book.title } 
  artist nil
end
