require 'account'

describe Account do
  let(:account) { Account.new("0123456789") }
  let(:account_invalid) { Account.new("01235") }
  

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Account" do
         o = Object.new
        expect(account).to be_an_instance_of Account
      end
    end

    context "with invalid input" do
      it "throws an InvalidAccountNumberError when acct_number has less than 10 digits" do
        expect{account_invalid}.to raise_error(InvalidAccountNumberError) 
      end
    end
  end

  context "when using default starting_balance" do
    describe "#transactions" do
      it "returns the default starting_balance" do
        expect(account.balance).to eq 0
      end
    end

    describe "#balance" do
      it "is 0" do    
     expect(account.balance).to eq 0        
      end
    end
  end

  context "when initialized with a starting_balance" do
    let(:account) { Account.new("1234567890", 100) }
    let(:balance_static) { 100 }
    let(:dec) { 50 }
    describe "#transactions" do
      it "returns the specified balance" do
        expect(account.balance).to eq(account.balance)
      end
    end

    describe "#balance" do
      it "is the specified balance" do
        expect(account.balance).to eq(balance_static)
      end
    end

    describe "#withdraw!" do
      let(:account) { Account.new("0123456789", 500) }
      it "decreases the balance" do
        expect{account.withdraw!(dec)}.to change(account, :balance)
      end

      it "substracts positive amounts" do
        account.withdraw!(-100)
        expect(account.balance).to eq(400)
      end
    end
  end

  describe "#account_number" do
    it "masks the number of the account" do
      expect(account.acct_number).to eq("******6789")
    end
  end

  describe "deposit!" do
    it "requires a positive amount" do
      expect(account.deposit!(10)).to be > 0

    end

    it "increases the balance of the account" do
      expect{account.deposit!(100)}.to change(account, :balance)
    end
  end

  describe "#withdraw!" do
    let(:dec) { 50 }
    it "throws an OverdraftError when withdraw amount is bigger than balance" do
      expect{account.withdraw!(50)}.to  raise_error(OverdraftError)
    end
  end
end
