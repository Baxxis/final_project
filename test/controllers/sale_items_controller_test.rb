require 'test_helper'

class SaleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_item = sale_items(:one)
  end

  test "should get index" do
    get sale_items_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_item_url
    assert_response :success
  end

  test "should create sale_item" do
    assert_difference('SaleItem.count') do
      post sale_items_url, params: { sale_item: { begin_date: @sale_item.begin_date, end_date: @sale_item.end_date, percent_discount: @sale_item.percent_discount, product_id: @sale_item.product_id } }
    end

    assert_redirected_to sale_item_url(SaleItem.last)
  end

  test "should show sale_item" do
    get sale_item_url(@sale_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_item_url(@sale_item)
    assert_response :success
  end

  test "should update sale_item" do
    patch sale_item_url(@sale_item), params: { sale_item: { begin_date: @sale_item.begin_date, end_date: @sale_item.end_date, percent_discount: @sale_item.percent_discount, product_id: @sale_item.product_id } }
    assert_redirected_to sale_item_url(@sale_item)
  end

  test "should destroy sale_item" do
    assert_difference('SaleItem.count', -1) do
      delete sale_item_url(@sale_item)
    end

    assert_redirected_to sale_items_url
  end
end
