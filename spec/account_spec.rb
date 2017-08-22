require './lib/account.rb'
require 'date'

describe Account do

  it 'is expected to create 4 digit pin code' do
    number = (subject.pin_number)
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to be active at initialize' do
    expect(subject.status).to eq :active
  end
end
