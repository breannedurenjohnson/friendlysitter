require 'rails_helper'

RSpec.describe Sitter, type: :model do
  it "should not save if first_name field is blank" do
    sitter = Sitter.new(
        first_name: '', 
        last_name: 'Bork', 
        email: 'olivia@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    expect(sitter).to be_invalid
  end
  
  it "should not save if last_name field is blank" do
    sitter = Sitter.new(
        first_name: 'Olivia', 
        last_name: '', 
        email: 'olivia@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    expect(sitter).to be_invalid
  end

  it "should not save if email already exists" do
    sitter1 = Sitter.new(
        first_name: 'Olivia', 
        last_name: 'Bork', 
        email: 'olivia@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    sitter1.save()
    sitter2 = Sitter.new(
        first_name: 'Olivia', 
        last_name: 'Bork', 
        email: 'olivia@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    expect(sitter2).to be_invalid
  end
  
  it "should not save if invalid email format" do
    sitter = Sitter.new(
        first_name: 'Olivia', 
        last_name: 'Bork', 
        email: 'oliviagmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    expect(sitter).to be_invalid
  end

  it "should not save if password is too short" do
    sitter = Sitter.new(
        first_name: 'Olivia', 
        last_name: 'Bork', 
        email: 'olivia@gmail.com',
        password: '123',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Available for part time help',
        hourly_rate: 20,
      )
    expect(sitter).to be_invalid
  end

  it "should not save if hourly_rate is incorrect format" do
    sitter = Sitter.new(
      first_name: 'Olivia', 
      last_name: 'Bork', 
      email: 'olivia@gmail.com',
      password: '12345678',
      city: 'Minneapolis',
      state: 'MN',
      about: 'Available for part time help',
      hourly_rate: 'twenty dollars',
      )
    expect(sitter).to be_invalid
  end
end
