require_relative('../db/sql_runner')

class Clothing

  attr_reader :id 
  attr_accessor :type, :clothing_store_id 

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @clothing_store_id = options['clothing_store_id'].to_i
  end

  def save()
    sql = "INSERT INTO clothes (type, clothing_store_id) VALUES ('#{@type}', '#{@clothing_store_id}') RETURNING *"
    clothing = SqlRunner.run( sql ).first
    @id = clothing['id']
  end

  def clothing_store()
    sql = "SELECT * FROM clothing_stores WHERE id = #{clothing_store_id}"
    clothing_store = SqlRunner.run(sql).first
    return ClothingStore.new(clothing_store)
  end

  def delete()
    sql = "DELETE FROM clothes WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def edit()
    sql = "UPDATE clothes SET
          type = '#{@type}',
          clothing_store_id = '#{@clothing_store_id}'
          WHERE id = #{@id}"
    SqlRunner.run ( sql )
  end 

end