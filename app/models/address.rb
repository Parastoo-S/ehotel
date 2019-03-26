class Address < ApplicationRecord

  validates :street_number,
    presence: {message: "Please provide the street number."}

  validates :street_name,
    presence: {message: "Please provide the street name."}

  validates :apt_number,
    presence: {message: "Please provide the Apartment number."}

  validates :city,
    presence: {message: "Please enter the city."}

  validates :state,
    presence: {message: "Please enter the state."}

  validates :zip,
    presence: {message: "Please enter the state."}
    format: {with: /^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$/}
    length: { maximum: 6 }
end
