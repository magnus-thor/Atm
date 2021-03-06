require 'date'

class Account

  STANDARD_VALIDITY_YRS = 5
  attr_accessor  :status,  :owner, :balance
  attr_reader :pin_code, :exp_date

  def initialize(attrs = {})
    @pin_code = create_pin_number
    @exp_date = exp_date_create
    @status = :active
    @owner = set_owner(attrs[:owner])
    @balance = 0
  end

  private
  def create_pin_number
    rand(1000..9999)
  end

  def exp_date_create
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def set_owner(obj)
    obj == nil ? missing_owner : obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end

  public
  def deactivate
    @status = :deactivated
  end
end
