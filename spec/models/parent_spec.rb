require 'rails_helper'

RSpec.describe Parent, type: :model do
  it "should not save if first_name field is blank" do
    parent = Parent.new(
        first_name: '', 
        last_name: 'Johnson', 
        email: 'breanne@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    expect(parent).to be_invalid
  end
  
  it "should not save if last_name field is blank" do
    parent = Parent.new(
        first_name: 'Breanne', 
        last_name: '', 
        email: 'breanne@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    expect(parent).to be_invalid
  end

  it "should not save if email already exists" do
    parent1 = Parent.new(
        first_name: 'Breanne', 
        last_name: '', 
        email: 'breanne@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    parent1.save()
    parent2 = Parent.new(
        first_name: 'Breanne', 
        last_name: '', 
        email: 'breanne@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    expect(parent2).to be_invalid
  end
  
  it "should not save if invalid email format" do
    parent = Parent.new(
        first_name: 'Breanne', 
        last_name: 'Johnson', 
        email: 'breannegmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    expect(parent).to be_invalid
  end

  it "should not save if password is too short" do
    parent = Parent.new(
        first_name: 'Breanne', 
        last_name: 'Johnson', 
        email: 'breannegmail.com',
        password: '123',
        city: 'Minneapolis',
        state: 'MN',
        about: 'Looking for part time help'
      )
    expect(parent).to be_invalid
  end

  it "still saves if about is blank" do
    parent = Parent.new(
        first_name: 'Breanne', 
        last_name: 'Johnson', 
        email: 'breanne@gmail.com',
        password: '12345678',
        city: 'Minneapolis',
        state: 'MN',
        about: ''
      )
    expect(parent).to be_valid
  end
end
