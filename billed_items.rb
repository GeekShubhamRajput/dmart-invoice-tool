# frozen_string_literal: true

class BilledItems
  PRICE_LIST = { 'milk': 65, 'bread': 30, 'egg': 10 }.freeze

  attr_accessor :name, :quantity, :rate

  def initialize(name, quantity, rate)
    @name = name
    @quantity = quantity || 1
    @rate = rate
  end

  def line_total
    quantity * rate
  end

  def self.add_or_update_item(item)
    @all_items ||= []
    existing_item = @all_items.find { |i| i.name.downcase == item.name.downcase }
    if existing_item
      existing_item.quantity += item.quantity
    else
      @all_items << item
    end
    @all_items
  end

  def self.list_items
    @all_items
  end

  def self.total_amount
    return 0 unless @all_items&.any?

    @all_items.inject(0) { |sum, item| sum + item.line_total }
  end
end
