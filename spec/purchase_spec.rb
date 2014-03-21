require 'spec_helper'

describe Purchase do
  describe '#initialize' do
    it 'initializes an instance of Purchase' do
      test_purchase = Purchase.new({:description => 'burgers', :amount => 5, :date => '2004-10-19 10:23:54', :category_id => 1, :company_id => 2})
      test_purchase.should be_an_instance_of Purchase
    end

    it 'returns the values of the instance variables' do
      test_purchase = Purchase.new({:id => 3, :description => 'burgers', :amount => 5, :date => '2004-10-19 10:23:54', :category_id => 1, :company_id => 2})
      test_purchase.description.should eq 'burgers'
      test_purchase.amount.should eq 5
      test_purchase.date.should eq '2004-10-19 10:23:54'
      test_purchase.category_id.should eq 1
      test_purchase.company_id.should eq 2
      test_purchase.id.should be_an_instance_of Fixnum
    end
  end

  # describe '.create' do
  #   it 'creates and saves a new instance of Purchase' do
  #     test_purchase = Purchase.create({:id => 3, :description => 'burgers', :amount => 5, :date => '2004-10-19 10:23:54', :category_id => 1, :company_id => 2})
  #     Purchase.all.should eq [test_purchase]
  #   end
  # end

  describe '==' do
    it 'accepts matching names for objects as comparable' do
      test_purchase1 = Purchase.create({:id => 3, :description => 'burgers', :amount => 5, :date => '2004-10-19 10:23:54', :category_id => 1, :company_id => 2})
      test_purchase2 = Purchase.create({:id => 3, :description => 'burgers', :amount => 5, :date => '2004-10-19 10:23:54', :category_id => 1, :company_id => 2})
      test_purchase1.should eq test_purchase2
    end
  end

end
