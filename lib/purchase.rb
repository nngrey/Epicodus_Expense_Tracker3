class Purchase

  attr_reader :description, :amount, :date, :id

  def initialize(input_hash)
    @description = input_hash['description']
    @amount = input_hash['amount']
    @date = input_hash['date']
    @id = input_hash['id']
  end

  def save
    result = DB.exec("INSERT INTO purchase (description, amount, date) VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM purchase;")
    purchases = []
    results.each do |result|
      purchases << Purchase.new(result)
    end
    purchases
  end

  def ==(another_purchase)
    self.description == another_purchase.description && self.date == another_purchase.date
  end

  def add_category(category)
    result = DB.exec("INSERT INTO purchase_category (purchase_id, category_id) VALUES (#{@id}, #{category.id});")
  end
end
