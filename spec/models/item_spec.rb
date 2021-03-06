require 'spec_helper'
require 'item'

describe Item do
  it 'has name, price, description, and image' do
    item = Item.new("Shalala", 5.95, "Tastes", "Blob.jpg")
    expect(item.name).to eq ("Shalala")
    expect(item.price).to eq (5.95)
    expect(item.description).to eq ("Tastes")
    expect(item.image).to eq ("Blob.jpg")
  end
  it 'knows that items are the same if they have the same attributes' do
    item1 = Item.new("Shalala", 5.95, "Tastes")
    item2 = Item.new("Shalala", 5.95, "Tastes")

    expect(item1).to eq (item2)
  end

  it 'lowers item price on wednesdays' do

    item = Item.new("Shalala", 5.95, "Tastes", "Blob.jpg")

    day = Date.today
    if day.wday == 3
      day = true
    else
      day = false
    end

    if day == true
      expect(item.discount?).to eq(5.36)
    else
      expect(item.discount?).to eq (5.95)
    end
  end

  it 'knows what days an item is available' do
    item = Item.new("Shalala", 5.95, "Tastes", "Blob.jpg", "Tuesday-Wednesday-Thursday")

    item.weekdays_available

    day = Date.today.wday

    actual = item.available?(day)

    visit "/"
      expect(actual).to eq(true)
  end
end