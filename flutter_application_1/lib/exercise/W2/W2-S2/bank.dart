class BankAccount {
  String accountOwner;
  int accountId;
  double balance;

  BankAccount(this.accountOwner, this.accountId, this.balance);

  double getBalance() {
    return balance;
  }
  void withdraw(double amount) {
    double calculateMoney = (balance - amount);
    if (calculateMoney > 0) {
      balance -= amount;
      print('Withdraw amount: \$$amount,\nYour balance after withdraw: \$$balance');
    } else {
      print('You do not have enough money for withdrawal!');
    }
  }
  void credit(double amount) {
    balance += amount;
    print('You credited: \$$amount,\nYour balance after credit: \$$balance');
  }
}
class Bank {
  String bankName;
  List<BankAccount> accounts = [];

  Bank(this.bankName);

  BankAccount? createAccount(String accountOwner, int accountId) {
    for (var account in accounts) {
      if (account.accountId == accountId) {
        print('Please create a unique account ID!');
        return null;
      }
    }
    BankAccount createNew = BankAccount(accountOwner, accountId, 0);
    accounts.add(createNew);
    print("Your account created!");
    return createNew;
  }
}
void main() {
  Bank bank = Bank("ABA");
  BankAccount? vineAcc = bank.createAccount('Vine', 12345);
  if (vineAcc != null) {
    vineAcc.credit(5000);
    vineAcc.withdraw(1000);
  }
  // cannot create this account 
  bank.createAccount('chim tila', 12345);
}
