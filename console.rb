require_relative( 'models/movie' )
require_relative( 'models/star' )
require_relative( 'models/casting' )

require( 'pry-byebug' )

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


star1 = Star.new('first_name' => 'Jim', 'last_name' => 'Carey')
star2 = Star.new('first_name' => 'Rob', 'last_name' => 'Lowe')
star3 = Star.new('first_name' => 'Charley', 'last_name' => 'Sheen')
star4 = Star.new('first_name' => 'Steve', 'last_name' => 'Martin')
star5 = Star.new('first_name' => 'Morgan', 'last_name' => 'Freeman')
star6 = Star.new('first_name' => 'Sharon', 'last_name' => 'Stone')
star7 = Star.new('first_name' => 'Barbera', 'last_name' => 'Striesand')
star8 = Star.new('first_name' => 'Goldie', 'last_name' => 'Hawn')
star9 = Star.new('first_name' => 'Robert', 'last_name' => 'De Niro')
star10 = Star.new('first_name' => 'Ben', 'last_name' => 'Stiller')

star1.save()
star2.save()
star3.save()
star4.save()
star5.save()
star6.save()
star7.save()
star8.save()
star9.save()


movie1 = Movie.new('title' => 'The Jerk', 'genre' => 'Comedy', 'budget' => 10000000)
movie2 = Movie.new('title' => 'Cape Fear', 'genre' => 'Horror','budget' => 2000000)
movie3 = Movie.new('title' => 'The Mask', 'genre' => 'Comedy', 'budget' => 7400000)
movie4 = Movie.new('title' => 'Bad Company', 'genre' => 'Drama', 'budget' => 423423000)
movie5 = Movie.new('title' => 'Dumb & Dumber', 'genre' => 'Comedy', 'budget' => 123455667)
movie5 = Movie.new('title' => 'Ace Ventura - Pet Detective', 'genre' => 'Comedy', 'budget' => 89324884 )
movie6 = Movie.new('title' => 'The man with two brains', 'genre' => 'Comedy', 'budget' => 9812432 )
movie7 = Movie.new('title' => 'Meet the parents', 'genre' => 'Comedy', 'budget' => 98344893)

movie1.save()
movie2.save()
movie3.save()
movie4.save()
movie5.save()
movie6.save()
movie7.save()


casting1 = Casting.new({'star_id' => star1.id, 'movie_id' => movie3.id, 'fee' => 2000000})
casting2 = Casting.new({'star_id' => star1.id, 'movie_id' => movie7.id, 'fee'=> 1000000})
casting3 = Casting.new({'star_id' => star9.id, 'movie_id' => movie7.id, 'fee' => 500000})
casting4 = Casting.new({'star_id' => star7.id, 'movie_id' => movie7.id, 'fee' => 4000000})
casting5 = Casting.new({'star_id' => star1.id, 'movie_id' => movie5.id, 'fee' => 3000000})
casting6 = Casting.new({'star_id' => star4.id, 'movie_id' => movie3.id, 'fee' => 400000})
casting7 = Casting.new({'star_id' => star2.id, 'movie_id' => movie4.id, 'fee' => 10000})
casting8 = Casting.new({'star_id' => star9.id, 'movie_id' => movie2.id, 'fee' => 50000})

casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()
casting6.save()
casting7.save()
casting8.save()

binding.pry

nil
