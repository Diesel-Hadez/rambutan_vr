require 'test_helper'

class ActorMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_movie = actor_movies(:one)
  end

  test "should get index" do
    get actor_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_actor_movie_url
    assert_response :success
  end

  test "should create actor_movie" do
    assert_difference('ActorMovie.count') do
      post actor_movies_url, params: { actor_movie: {  } }
    end

    assert_redirected_to actor_movie_url(ActorMovie.last)
  end

  test "should show actor_movie" do
    get actor_movie_url(@actor_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_movie_url(@actor_movie)
    assert_response :success
  end

  test "should update actor_movie" do
    patch actor_movie_url(@actor_movie), params: { actor_movie: {  } }
    assert_redirected_to actor_movie_url(@actor_movie)
  end

  test "should destroy actor_movie" do
    assert_difference('ActorMovie.count', -1) do
      delete actor_movie_url(@actor_movie)
    end

    assert_redirected_to actor_movies_url
  end
end
