class Category

  attr_reader :type, :id

  def initialize(input_hash)
    @type = input_hash['type']
    @id = input_hash['id']
  end

  def save
    result = DB.exec("INSERT INTO category (type) VALUES ('#{@type}') RETURNING id;")
    @id = result.first['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM category;")
    categories = []
    results.each do |result|
      categories << Category.new(result)
    end
    categories
  end

  def ==(another_category)
    self.type == another_category.type
  end

end
