class Purchase

  attr_reader :description, :amount, :id, :date, :category_id, :company_id

  def initialize(input_hash)
    @description = input_hash[:description]
    @amount = input_hash[:amount].to_i
    @id = input_hash[:id].to_i
    @date = input_hash[:date]
    @category_id = input_hash[:category_id].to_i
    @company_id = input_hash[:company_id].to_i
  end

  def self.create(input_hash)
    new_purchase = Purchase.new(input_hash)
    new_purchase.save
    new_purchase
  end

  def save
    result = DB.exec("INSERT INTO purchase (description, amount, date, category_id, company_id) VALUES ('#{@description}', #{@amount}, '#{@date}', #{category_id}, #{company_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    purchases = []
    results = DB.exec("SELECT * FROM purchase;")
    results.each do |result|
      purchases << Purchase.new(result)
    end
    purchases
  end

  def ==(another_purchase)
    self.description == another_purchase.description && self.amount == another_purchase.amount && self.date == another_purchase.date && self.category_id == another_purchase.category_id && self.company_id == another_purchase.company_id && self.id == another_purchase.id
  end
end
