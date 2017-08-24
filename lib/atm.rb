class Atm
  attr_accessor :funds
  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when incorrect_pin?(pin_code, account.pin_code)
      error_message('wrong pin')
    when insufficient_funds_in_account?(amount, account)
      error_message('insufficient funds in account')
    when insufficient_funds_in_atm?(amount)
      error_message('insufficient funds in ATM')
    when card_expired?(account.exp_date)
      error_message('card expired')
    when card_active?(account.status)
      error_message('card is disabled')
    else
      perform_transaction(amount, account)
    end
  end

  def error_message(message)
    { status: false,
      message: message,
      date: Date.today }
  end
  
  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance -= amount
    { status: true,
      message: 'success',
      date: Date.today,
      amount: amount,
      bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def card_active?(is_active)
    is_active != :active
  end
end
