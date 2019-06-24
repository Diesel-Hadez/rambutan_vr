require "application_system_test_case"

class ActorMoviesTest < ApplicationSystemTestCase
  setup do
    @actor_movie = actor_movies(:one)
  end

  test "visiting the index" do
    visit actor_movies_url
    assert_selector "h1", text: "Actor Movies"
  end

  test "creating a Actor movie" do
    visit actor_movies_url
    click_on "New Actor Movie"

    click_on "Create Actor movie"

    assert_text "Actor movie was successfully created"
    click_on "Back"
  end

  test "updating a Actor movie" do
    visit actor_movies_url
    click_on "Edit", match: :first

    click_on "Update Actor movie"

    assert_text "Actor movie was successfully updated"
    click_on "Back"
  end

  test "destroying a Actor movie" do
    visit actor_movies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actor movie was successfully destroyed"
  end
end
