require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end

post('/stores') do
  Store.create({:name => params['new_store']})
  redirect('/')
end

post('/shoes') do
  Shoe.create({:brand => params['new_shoe']})
  redirect('/')
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @shoes = Shoe.all()
  erb(:store)
end

delete('/stores/:id') do
  store = Store.find(params.fetch('id').to_i)
  store.destroy()
  redirect('/')
end

patch('/stores/:id') do
  store = Store.find(params.fetch('id').to_i)
  name = params.fetch("store_name")
  store.update({:name => name})
  redirect to('/')
end

patch('/stores/:id/add_shoes') do
  @store = Store.find(params.fetch('id').to_i)
  shoe_ids = []
  shoe_ids = params['shoe_ids']
  shoe_ids.each() do |shoe_id|
    shoe = Shoe.find(shoe_id)
    if !@store.shoes.include? (shoe)
      @store.shoes << shoe
    end
  end
  redirect to('/')
end

get('/shoes/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:shoe)
end

get('/stores/shoes/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:shoe)
end

get('/shoes/stores/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i)
  @store = Store.find(params.fetch('id').to_i)
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:shoe)
end

delete('/shoes/:id') do
  shoe = Shoe.find(params.fetch('id').to_i)
  shoe.destroy()
  redirect('/')
end

patch('/shoes/:id') do
  brand = params.fetch("shoe_brand")
  @shoe = Shoe.find(params.fetch('id').to_i)
  @shoe.update({:brand => brand})
  redirect to('/')
end
