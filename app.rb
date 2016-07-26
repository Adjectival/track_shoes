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
  if params[:shoe_ids]
    shoe_ids = []
    params[:shoe_ids].each() do |shoe_id|
      shoe_ids << shoe_id.to_i()
    end
    shoe_ids.each() do |shoe_id|
      Shoe.find(shoe_id).stores << store
    end
  end
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
  name = params.fetch("name")
  store.update({:name => name})

  if params[:shoe_ids]
    shoe_ids = []
    params[:shoe_ids].each() do |shoe_id|
      shoe_ids << shoe_id.to_i()
    end
    shoe_ids.each() do |shoe_id|
      Shoe.find(shoe_id).stores << store
    end
  end
  redirect to('/stores/#{store.id}')
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
  brand = params.fetch("brand")
  @shoe = Shoe.find(params.fetch('id').to_i)
  @shoe.update({:brand => brand})
  redirect to('/shoes/#{@shoe.id}')
end
