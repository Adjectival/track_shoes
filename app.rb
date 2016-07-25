require("bundler/setup")
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

patch('/stores/:id') do
  @stores = Store.all()
  redirect to('/')
end

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch('id').to_i)
  @stores = Store.all()
  @shoes = Shoe.all()
  @store.destroy()
  redirect('/')
end

get('/shoes/:id') do
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:shoe)
end

patch('/shoes/:id') do
  @shoes = Shoe.all()
  redirect to('/')
end

delete('/shoes/:id/delete') do
  @shoes = Shoe.all()
  @shoe = Shoe.find(params.fetch('id').to_i)
  @stores = Store.all()
  @shoe.destroy()
  redirect('/')
end
