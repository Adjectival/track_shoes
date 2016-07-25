require("bundler/setup")
require("pry")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end

post('/stores/new') do
  Store.create({:name => params['new_store']})
  redirect('/')
end

post('/shoes/new') do
  Shoe.create({:brand => params['new_shoe']})
  redirect('/')
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @shoes = Shoe.all()
  erb(:store)
end

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch('id').to_i)
  @stores = Store.all()
  @shoes = Shoe.all()
  @store.destroy()
  redirect('/')
end

patch('/stores/:id/edit') do
  @stores = Store.all()
  @store = Store.find(params.fetch('id').to_i)
  name = params.fetch("name")
  @store.update({:name => name})
  redirect to('/')
end

post('/stores/:id/add_shoes') do
  @store = Store.find(params['id'].to_i)
  shoe_ids = params.fetch('shoe_ids')
  shoe = Shoe.find(shoe_ids)
  shoe.each do |shoe|
    @store.shoes << shoe
  end
  redirect to('/')
end

get('/shoes/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:shoe)
end

delete('/shoes/:id/delete') do
  @shoes = Shoe.all()
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  @shoe.destroy()
  redirect('/')
end

patch('/shoes/:id/edit') do
  @shoes = Shoe.all()
  @shoe = Shoe.find(params.fetch('id').to_i)
  brand = params.fetch("brand")
  @shoe.update({:brand => brand})
  redirect to('/')
end
