require 'test_helper'

class PrimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prime = primes(:one)
  end

  test "should get index" do
    get primes_url
    assert_response :success
  end

  test "should get new" do
    get new_prime_url
    assert_response :success
  end

  test "should create prime" do
    assert_difference('Prime.count') do
      post primes_url, params: { prime: { primenum: @prime.primenum } }
    end

    assert_redirected_to prime_url(Prime.last)
  end

  test "should show prime" do
    get prime_url(@prime)
    assert_response :success
  end

  test "should get edit" do
    get edit_prime_url(@prime)
    assert_response :success
  end

  test "should update prime" do
    patch prime_url(@prime), params: { prime: { primenum: @prime.primenum } }
    assert_redirected_to prime_url(@prime)
  end

  test "should destroy prime" do
    assert_difference('Prime.count', -1) do
      delete prime_url(@prime)
    end

    assert_redirected_to primes_url
  end
end
