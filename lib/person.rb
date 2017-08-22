require './lib/account.rb'

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

  def deposit(amount)
    @account == nil ? no_account : deposit_funds(amount)
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

  def no_account
    raise RuntimeError, 'No account present'
  end
end
