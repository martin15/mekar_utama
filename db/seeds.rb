# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
username = User.find_or_create_by_email(:email => "martin.me15@yahoo.com",
    :password => "1q2w3e4r5t",
    :password_confirmation => "1q2w3e4r5t")
puts username.inspect

username2 = User.find_or_create_by_email(:email => "mekar_utama1@yahoo.com",
    :password => "1q2w3e4r5t",
    :password_confirmation => "1q2w3e4r5t")
puts username2.inspect

pencil =  Category.find_or_create_by_name(:name => "Pencil")
puts pencil.inspect

embroidery =  Category.find_or_create_by_name(:name => "Embroidery")
puts embroidery.inspect

about_us =  Setting.find_or_create_by_name(:name => "about_us")
puts about_us.inspect

contact_us =  Setting.find_or_create_by_name(:name => "contact_us")
puts contact_us.inspect

info_product_1 =  Setting.find_or_create_by_name(:name => "Pensil")
puts info_product_1.inspect

info_product_2 =  Setting.find_or_create_by_name(:name => "Embroidery")
puts info_product_2.inspect

Product.all.each do |product|
if product.image_file_name.nil?
product.image = product.product_images.primary.first.product_image
puts product.image
product.save
end
end
