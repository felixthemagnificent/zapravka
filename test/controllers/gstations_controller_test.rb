require 'test_helper'

class GstationsControllerTest < ActionController::TestCase
  setup do
    @gstation = gstations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gstations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gstation" do
    assert_difference('Gstation.count') do
      post :create, gstation: { gasavail: @gstation.gasavail, lat: @gstation.lat, lon: @gstation.lon, name: @gstation.name, queue: @gstation.queue, rating: @gstation.rating }
    end

    assert_redirected_to gstation_path(assigns(:gstation))
  end

  test "should show gstation" do
    get :show, id: @gstation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gstation
    assert_response :success
  end

  test "should update gstation" do
    patch :update, id: @gstation, gstation: { gasavail: @gstation.gasavail, lat: @gstation.lat, lon: @gstation.lon, name: @gstation.name, queue: @gstation.queue, rating: @gstation.rating }
    assert_redirected_to gstation_path(assigns(:gstation))
  end

  test "should destroy gstation" do
    assert_difference('Gstation.count', -1) do
      delete :destroy, id: @gstation
    end

    assert_redirected_to gstations_path
  end
end
