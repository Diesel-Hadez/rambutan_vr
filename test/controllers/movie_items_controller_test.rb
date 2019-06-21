require 'test_helper'

class MovieItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_item = movie_items(:one)
  end

  test "should get index" do
    get movie_items_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_item_url
    assert_response :success
  end

  test "should create movie_item" do
    assert_difference('MovieItem.count') do
      post movie_items_url, params: { movie_item: {  } }
    end

    assert_redirected_to movie_item_url(MovieItem.last)
  end

  test "should show movie_item" do
    get movie_item_url(@movie_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_item_url(@movie_item)
    assert_response :success
  end

  test "should update movie_item" do
    patch movie_item_url(@movie_item), params: { movie_item: {  } }
    assert_redirected_to movie_item_url(@movie_item)
  end

  test "should destroy movie_item" do
    assert_difference('MovieItem.count', -1) do
      delete movie_item_url(@movie_item)
    end

    assert_redirected_to movie_items_url
  end
end
