class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_owner(attrs[:name])
    @cash = 0
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @name = obj
  end

  def missing_owner
    raise 'A name is required'
  end

end
