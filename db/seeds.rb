# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserSong.delete_all
User.delete_all
Song.delete_all
Genre.delete_all

g = Genre.create!(name: 'pop')
g2 = Genre.create!(name: 'reggae')
g3 = Genre.create!(name: 'rock')

p1 = g.songs.build(name: 'Maddona 1', duration: 200).save
p2 = g.songs.build(name: 'Maddona 2', duration: 340).save

r1 = g2.songs.build(name: 'reggae 1', duration: 300).save
r2 = g2.songs.build(name: 'reggae 2', duration: 320).save

ro1 = g3.songs.build(name: 'Starway to the heaven', duration: 430).save
ro2 = g3.songs.build(name: 'Starway to the heaven remix', duration: 420).save


u1 = User.create!(name: 'felipe', email: 'f@f.cl', password: 'asd123')
u2 = User.create!(name: 'daniela', email: 'd@d.cl', password: 'asd123')
u3 = User.create!(name: 'admin', email: 'admin@admin.cl', password: 'asd123')


