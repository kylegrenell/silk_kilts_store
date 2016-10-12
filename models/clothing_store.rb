require_relative('../db/sql_runner')

class ClothingStore

  attr_reader :id
  attr_accessor :name, :address, :type

  def initialize(options)
    @id = options['id'].to_i 
    @name = options['name']
    @address = options['address']
    @type = options['type']
    # new class with options passed in as a hash containing instance variables
  end

  def save()
    sql = "INSERT INTO clothing_stores (name, address, type) VALUES ('#{@name}', '#{@address}','#{@type}') RETURNING *"
    clothing_store = SqlRunner.run( sql ).first
    @id = clothing_store['id']
  end

  def clothing()
    sql = "SELECT * FROM clothes WHERE clothing_store_id = #{@id}"
    clothing = SqlRunner.run(sql).map {|clothes| Clothing.new(clothes)}
    return clothing
  end

  def self.find(id)
    sql = "SELECT * FROM clothing_stores WHERE id = #{id}"
    clothing_store = SqlRunner.run( sql ).first
    return ClothingStore.new(clothing_store)
  end

  def edit()
    sql = "UPDATE clothing_stores SET
          name = '#{@name}',
          address = '#{@address}',
          type = '#{@type}' WHERE
          id = #{@id}"
    SqlRunner.run ( sql )
  end 

end