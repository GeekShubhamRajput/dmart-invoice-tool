# frozen_string_literal: true

class BilledItems
  ITEAM_RATE = { 'milk': 65, 'bread': 30, 'egg': 10 }.freeze

  attr_accessor :name, :quantity, :rate

  def initialize(name, quantity, rate)
    @name = name
    @quantity = quantity || 1
    @rate = rate
  end

  def item_price
    quantity * rate
  end

  def self.add_item(item)
    @total_items ||= []
    existing_item = @total_items.find { |i| i.name.downcase == item.name.downcase }
    if existing_item
      existing_item.quantity += item.quantity
    else
      @total_items << item
    end
    @total_items
  end

  def self.all_items
    @total_items
  end

  def self.grand_total
    return 0 unless @total_items&.any?

    @total_items.inject(0) { |sum, item| sum + item.item_price }
  end
end
