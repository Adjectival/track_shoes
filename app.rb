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
  @stores = Store.all()
  erb(:store)
end

patch('/stores/:id') do
  @stores = Store.all()
  erb(:store)
end

delete('/stores/:id') do
  @stores = Store.all()
  erb(:store)
end





get('/shoes/new') do
  @shoes = Shoe.all()
  erb(:new_shoe_form)
end
post('/shoes/new') do
  @shoes = Shoe.all()
  erb(:new_shoe_form)
end
