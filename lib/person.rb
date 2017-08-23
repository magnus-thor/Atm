require './lib/account.rb'
require './lib/atm.rb'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_owner(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(args = {})
    @account == nil ? no_account : deposit_funds(args)
  end

  def withdraw(args = {})
    @account == nil ? no_account : withdraw_funds(args)
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @name = obj
  end

  def missing_owner
    raise 'A name is required'
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_funds(args = {})
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    amount = args[:amount]
    pin = args[:pin]
    account = args[:account]
    response = atm.withdraw(amount, pin, account)
    # response = atm.withdraw(args[:amount], args[:pin], args[account])
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def missing_atm
    raise 'An ATM is required'
  end
  def no_account
    raise RuntimeError, 'No account present'
  end
end
