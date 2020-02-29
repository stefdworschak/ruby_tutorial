require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "must not save a customer when forename surname and email are not provided" do
    customer = Customer.new(forename: "John", email: "john.davidson@email.ie")
    assert_equal(false, customer.save, "saved the customer even though at least one of the forename, surname and/or email were not provided!")
  end

  test "must not save customer if phone contains non-digits" do
    customer = Customer.new(forename: "John",
                            surname: "Davidson",
                            phone: "12we3r",
                            email: "john.davidson@email.ie")
    assert(!customer.save, "saved the customer, even though the phone number is not valid!")
  end

  test "must allow only letters in forename and surname" do
    customer = Customer.new(forename: "John1",
                            surname: "Davidson1",
                            phone: "123456",
                            email: "john.davidson@email.ie")
    assert_equal(false, customer.save, "saved the customer even though name contains non-letters!")
  end

end
