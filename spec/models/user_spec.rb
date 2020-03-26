require 'rails_helper'

RSpec.describe 'User' ,type: :model do
context 'validates test' do  # (almost) plain English
  it 'ensures password presence' do
    user = User.new(email: 'a@gmail.com').save
    expect(user).to eq(false)  # test code
  end
  it 'ensures email presence' do
    user = User.new(password: '123456').save
    expect(user).to eq(false)  # test code
  end
  it 'should save sucessfully' do
    user = User.new(email: 'a@gmail.com', password: '123456').save
    expect(user).to eq(true)  # test code
  end
  it 'should save sucessfully' do
    user = User.create(email: 'a@gmail.com', password: '123456')
    expect(user).to eq(true)  # test code
  end
  it 'ensures email validation sucessfully' do
    user = User.new(email: 'agmail', password: '123456').save
    expect(user).to eq(false)  # test code
  end
  it 'ensures password size validation' do
    user = User.new(email: 'a@gmail.com', password: '1456').save
    expect(user).to eq(false)  # test code
  end
end
end
