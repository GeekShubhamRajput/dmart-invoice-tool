# frozen_string_literal: true

require_relative 'shape'

class DmartDetails
  attr_accessor :company_name, :adress, :phone_number

  def initialize(company_name, address, phone_number)
    @company_name = company_name
    @adress = address
    @phone_number = phone_number
  end
end
