require './lib/account.rb'
require './lib/atm.rb'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_owner(attrs[:name])
    @cash = 1000
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(args = {})
    @account.nil? ? no_account : deposit_funds(args)
  end

  def get_cash(args = {})
    @account.nil? ? no_account : withdraw_funds(args)
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @name = obj
  end

  def missing_owner
    raise 'A name is required'
  end

  def deposit_funds(amount)
    if @cash >= amount
      @cash -= amount
      @account.balance += amount
    else
      'You dont have enough money to do that'
    end
  end

  def withdraw_funds(args = {})
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    response = atm.withdraw(args[:amount], args[:pin], args[:account])
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
    @account.balance -= response[:amount]
  end

  def missing_atm
    raise 'An ATM is required'
  end

  def no_account
    raise 'No account present'
  end
end
