class Person

  attr_accessor :name

  def initialize(attrs = {})
    set_owner(attrs[:name])
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @name = obj
  end

  def missing_owner
    raise 'A name is required'
  end
end
