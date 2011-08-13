require 'spec_helper'

describe User do
  before(:each) do
    @attr = { 
      :name => "Example User", 
      :phone => "3193857101", 
      :password => 'foobar', 
      :password_confirmation => 'foobar' 
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a phone number" do
    no_phone_user = User.new(@attr.merge(:phone => ""))
    no_phone_user.should_not be_valid
  end
  
  it "should reject looooooong user names" do
    long_name = "jm" * 101
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid phone numbers" do
    phone_numbers = ['319-385-7101','3193857101','(319) 385-7101', '+1(319)-385-7101']
    phone_numbers.each do |phone|
      valid_phone_user = User.new(@attr.merge(:phone => phone))
      valid_phone_user.should be_valid
    end
  end
  
  it "should reject invalid phone numbers" do
    phone_numbers = ['+44 149 25 25 25','911']
    phone_numbers.each do |phone|
      valid_phone_user = User.new(@attr.merge(:phone => phone))
      valid_phone_user.should_not be_valid
    end
  end
  
  it "should reject repeat phone numbers" do
    User.create!(@attr)
    user_with_dup_phone = User.new(@attr)
    user_with_dup_phone.should_not be_valid
  end
  
  describe "password validation" do
  
    it "should require a password" do
      no_password_user = User.new(@attr.merge(:password => ''))
      no_password_user.should_not be_valid
    end
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end    

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end 
    end
    
    describe "authenticate method" do
      it "should return nil on phone/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:phone], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for a phone number with no user" do
        nonexistent_user = User.authenticate("1234567890", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on phone/password match" do
        matching_user = User.authenticate(@attr[:phone], @attr[:password])
        matching_user.should == @user
      end
    end
    
  end
end