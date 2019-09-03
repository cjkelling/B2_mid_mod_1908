require 'rails_helper'

describe "Books Index Page" do
  before :each do
    @harper_lee = Author.create(name: "Harper Lee")
    @tkam = @harper_lee.books.create(title: "To Kill a Mockingbird", number_of_pages: 296, publication_year: 1960)
  end

  it "can list all books" do
    visit '/books'

    expect(page).to have_content(@tkam.title)
    expect(page).to have_content(@tkam.number_of_pages)
    expect(page).to have_content(@tkam.publication_year)
    expect(page).to have_content(@tkam.authors.name)
  end
end
