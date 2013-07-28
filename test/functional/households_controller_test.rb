require 'test_helper'

class HouseholdsControllerTest < ActionController::TestCase
  setup do
    @household = households(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:households)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create household" do
    assert_difference('Household.count') do
      post :create, household: { adult_one_email: @household.adult_one_email, adult_one_firstname: @household.adult_one_firstname, adult_one_lastname: @household.adult_one_lastname, adult_one_phone: @household.adult_one_phone, adult_one_text: @household.adult_one_text, adult_two_email: @household.adult_two_email, adult_two_firstname: @household.adult_two_firstname, adult_two_lastname: @household.adult_two_lastname, adult_two_phone: @household.adult_two_phone, adult_two_text: @household.adult_two_text, city: @household.city, email: @household.email, phone: @household.phone, street: @household.street, zip: @household.zip }
    end

    assert_redirected_to household_path(assigns(:household))
  end

  test "should show household" do
    get :show, id: @household
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @household
    assert_response :success
  end

  test "should update household" do
    put :update, id: @household, household: { adult_one_email: @household.adult_one_email, adult_one_firstname: @household.adult_one_firstname, adult_one_lastname: @household.adult_one_lastname, adult_one_phone: @household.adult_one_phone, adult_one_text: @household.adult_one_text, adult_two_email: @household.adult_two_email, adult_two_firstname: @household.adult_two_firstname, adult_two_lastname: @household.adult_two_lastname, adult_two_phone: @household.adult_two_phone, adult_two_text: @household.adult_two_text, city: @household.city, email: @household.email, phone: @household.phone, street: @household.street, zip: @household.zip }
    assert_redirected_to household_path(assigns(:household))
  end

  test "should destroy household" do
    assert_difference('Household.count', -1) do
      delete :destroy, id: @household
    end

    assert_redirected_to households_path
  end
end
