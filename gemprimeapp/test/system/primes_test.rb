require "application_system_test_case"

class PrimesTest < ApplicationSystemTestCase
  setup do
    @prime = primes(:one)
  end

  test "visiting the index" do
    visit primes_url
    assert_selector "h1", text: "Primes"
  end

  test "creating a Prime" do
    visit primes_url
    click_on "New Prime"

    fill_in "Primenum", with: @prime.primenum
    click_on "Create Prime"

    assert_text "Prime was successfully created"
    click_on "Back"
  end

  test "updating a Prime" do
    visit primes_url
    click_on "Edit", match: :first

    fill_in "Primenum", with: @prime.primenum
    click_on "Update Prime"

    assert_text "Prime was successfully updated"
    click_on "Back"
  end

  test "destroying a Prime" do
    visit primes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prime was successfully destroyed"
  end
end
