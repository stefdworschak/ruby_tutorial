class Customer < ApplicationRecord
    has_many :orders

    # Make sure that forname, surname and email are required
    validates :forename, :surname, :email, presence: true

    # Make sure that phone only consists of numbers
    validates :phone, format: { 
        with: /\A[0-9]+\z/, 
        message: "accepts digits only!" }

    # Make sure that forename and surname only consist of letters
    validates_each :forename, :surname do |record, attr, value|
        record.errors.add(attr, 'must contain only letters!') if
        value =~ /[^\A[a-zA-Z]+\z]/
    end

end
