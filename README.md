[![Coverage Status](https://coveralls.io/repos/github/magnus-thor/Atm/badge.svg?branch=master)](https://coveralls.io/github/magnus-thor/Atm?branch=master)

# ATM Challenge
The ATM challenge for Craft Academy

# How to use the program
- First startup ` irb ` then load the program ` load './lib/person.rb'`
- Create a person in the program `person1 = Person(name: 'put_in_name')`
- And create an ATM `atm = Atm.new`
- When that is done you have a few methods to play with and 1000 in cash
- Create an account `person1.create_account`
- Deposit into the account `person1.deposit()` takes 1 argument in integers
- And withdraw from the atm `person1.get_cash(amount: 0, pin_code: person1.account.pin_code, account: person1.account, atm: atm)`
- And you can deactivate the account with `person1.account.deactivate`

# The tests wil fail if you deposit or withdraw and:

- There has not been created an ATM
- There has not been created an account
- The owner has not been set to account
- The amount deposited or withdrawn exceeds either funds in atm or your wallet
- If there is a failure with your card
  - expired
  - disabled
  - wrong pin


# Author
Magnús Þór Ársælsson
