require 'rails_helper'

describe "Author Show Page" do
  before :each do
    @harper_lee = Author.create(name: "Harper Lee")
    @tkam = @harper_lee.books.create(title: "To Kill a Mockingbird", number_of_pages: 296, publication_year: 1960)
  end

  it "shows all author information" do
    visit "/authors/#{@harper_lee.id}"

    expect(page).to have_content(@harper_lee.name)
    expect(page).to have_content("Books: #{@harper_lee.all_books}")
    expect(page).to have_content("Average Number of Pages: #{@harper_lee.average_number_of_pages}")
  end
end
