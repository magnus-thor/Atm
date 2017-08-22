require './lib/account.rb'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_owner(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @name = obj
  end

  def missing_owner
    raise 'A name is required'
  end


end
