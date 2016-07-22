require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post('/stores/new') do
  @stores = Store.all()
  erb(:new_store_form)
end

get('/new_store_form') do
  @stores = Store.all()
  redirect(:stores)
end

get('/store/:id') do
  @stores = Store.all()
  erb(:store)
end

patch('/store/:id') do
  @stores = Store.all()
  erb(:store)
end

delete('/store/:id') do
  @stores = Store.all()
  erb(:store)
end

get('/shoes') do
  @shoes = Shoes.all()
  erb(:shoes)
end

get('/shoes/new') do
  @shoes = Shoes.all()
  erb(:new_shoe_form)
end
post('/shoes/new') do
  @shoes = Shoes.all()
  redirect(:shoes)
end
