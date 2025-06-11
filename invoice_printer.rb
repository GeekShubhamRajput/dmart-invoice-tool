# frozen_string_literal: true

require_relative 'billed_items'
require_relative 'dmart_details'

loop do
  puts 'Enter Item Name'
  item_name = gets.chomp

  key_name = item_name.downcase.to_sym
  item_rate = BilledItems::PRICE_LIST[key_name]

  puts 'Enter Quantity'
  item_quantity = gets.to_i

  item = BilledItems.new(item_name, item_quantity, item_rate)
  BilledItems.add_or_update_item(item)

  puts 'Do you want to add another item? (yes/no)'
  answer = gets.chomp.downcase

  break unless answer == 'yes'
end

# Demart Details
dmart = DmartDetails.new('Dmart Kanadia, Indore', 'Near Bhnadhari farms, Kanadia main road, Indore', '6263345678')
Shape.dotted_line
puts 'D Mart'
Shape.dotted_line
puts dmart.company_name
puts dmart.adress
puts dmart.phone_number
Shape.dotted_line
Shape.tax_invoice

# Print table header
Shape.dotted_line
puts format('%-15s %-10s %-10s %-10s', 'Item', 'Quantity', 'Rate', 'Value')
Shape.dotted_line

# Print each item
BilledItems.list_items.each do |item|
  puts format('%-15s %-10d %-10d %-10d', item.name.capitalize, item.quantity, item.rate, item.line_total)
end

Shape.dotted_line
puts "Grand Total: #{BilledItems.total_amount}"
Shape.dotted_line
