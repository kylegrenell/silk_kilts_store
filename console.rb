require_relative('./models/clothing_store')
require_relative('./models/clothing')
require('pry-byebug')

silk_kilts = ClothingStore.new({'name' => "Silk Kilts", 'address' => "1 Million Street, Edinburgh", 'type' => "kilt"})

# silk_kilts.save()
silk_kilts.address = "14 Silky Street, Silk Mountain, Kiltville"

kilt1 = Clothing.new({'type' => "kilt", 'clothing_store_id' => silk_kilts.id})
kilt2 = Clothing.new({'type' => "kilt", 'clothing_store_id' => silk_kilts.id})

# kilt2.delete()
kilt2.

binding.pry
nil
