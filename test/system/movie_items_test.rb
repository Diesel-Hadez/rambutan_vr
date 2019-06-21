require "application_system_test_case"

class MovieItemsTest < ApplicationSystemTestCase
  setup do
    @movie_item = movie_items(:one)
  end

  test "visiting the index" do
    visit movie_items_url
    assert_selector "h1", text: "Movie Items"
  end

  test "creating a Movie item" do
    visit movie_items_url
    click_on "New Movie Item"

    click_on "Create Movie item"

    assert_text "Movie item was successfully created"
    click_on "Back"
  end

  test "updating a Movie item" do
    visit movie_items_url
    click_on "Edit", match: :first

    click_on "Update Movie item"

    assert_text "Movie item was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie item" do
    visit movie_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie item was successfully destroyed"
  end
end
