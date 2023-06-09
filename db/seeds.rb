# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u14f = Squadron.create(name:"14F")
u16f = Squadron.create(name:"16f")
u78 = Squadron.create(name: "78")
u85 = Squadron.create(name: "85")
u86 = Squadron.create(name: "86")
u94 = Squadron.create(name: "94")
u101 = Squadron.create(name: "101")
u114 = Squadron.create(name: "114")
u120 = Squadron.create(name: "120")
u267 = Squadron.create(name: "267")
u268 = Squadron.create(name: "268")
u342 = Squadron.create(name: "342")
u393 = Squadron.create(name: "393")
u398 = Squadron.create(name: "398")
u406 = Squadron.create(name: "406")
u862 = Squadron.create(name: "862")
u1083 = Squadron.create(name: "1083")
u1159 = Squadron.create(name: "1159")
u1374 = Squadron.create(name: "1374")
u1381 = Squadron.create(name: "1381")
u1454 = Squadron.create(name: "1454")
u1846 = Squadron.create(name: "1846")
u2236 = Squadron.create(name: "2236")
u2473 = Squadron.create(name: "2473")

athletics_comp = Competition.create(title: "Athletics",
                                    competition_date: Date.new(2023, 8, 16),
                                    location: "Watford",
                                    minimum_age: 12,
                                    locked: false)

u15m = AgeRange.create(competition: athletics_comp,
                       after: Date.new(2023, 8, 31) - 15.years,
                       before: Date.new(2023, 8, 31),
                       competing_category: "male",
                       display_name: "Under 15s Boys")

u17m = AgeRange.create(competition: athletics_comp,
                       after: Date.new(2023, 8, 31) - 17.years,
                       before: Date.new(2023, 8, 31) - 15.years - 1.day,
                       competing_category: "male",
                       display_name: "Under 17s Boys")

jm = AgeRange.create(competition: athletics_comp,
                     after: Date.new(2023, 8, 31) - 20.years,
                     before: Date.new(2023, 8, 31) - 17.years - 1.day,
                     competing_category: "male",
                     display_name: "Junior Mens")

u15f = AgeRange.create(competition: athletics_comp,
                       after: Date.new(2023, 8, 31) - 15.years,
                       before: Date.new(2023, 8, 31),
                       competing_category: "female",
                       display_name: "Under 15s Girls")

jw = AgeRange.create(competition: athletics_comp,
                     after: Date.new(2023, 8, 31) - 20.years,
                     before: Date.new(2023, 8, 31) - 15.years - 1.day,
                     competing_category: "female",
                     display_name: "Junior Women's")


hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "100m",
                                    capacity: 1)

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "100m",
                                    capacity: 1)

hundered_meters_jm = Event.create(competition: athletics_comp,
                                    age_range: jm,
                                    title: "100m",
                                  capacity: 1)

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "100m",
                                    capacity: 1)

hundered_meters_jw = Event.create(competition: athletics_comp,
                                    age_range: jw,
                                    title: "100m",
                                  capacity: 1)

hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "200m",
                                    capacity: 1)

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "200m",
                                    capacity: 1)

hundered_meters_jm = Event.create(competition: athletics_comp,
                                  age_range: jm,
                                  title: "200m",
                                  capacity: 1)

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "200m",
                                    capacity: 1)

hundered_meters_jw = Event.create(competition: athletics_comp,
                                  age_range: jw,
                                  title: "200m",
                                  capacity: 1)

hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "3/400m",
                                    capacity: 1)

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "3/400m",
                                    capacity: 1)

hundered_meters_jm = Event.create(competition: athletics_comp,
                                  age_range: jm,
                                  title: "3/400m",
                                  capacity: 1)

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "3/400m",
                                    capacity: 1)

hundered_meters_jw = Event.create(competition: athletics_comp,
                                  age_range: jw,
                                  title: "3/400m",
                                  capacity: 1)

hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "800m",
                                    capacity: 1)

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "800m",
                                    capacity: 1)

hundered_meters_jm = Event.create(competition: athletics_comp,
                                  age_range: jm,
                                  title: "800m",
                                  capacity: 1)

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "800m",
                                    capacity: 1)

hundered_meters_jw = Event.create(competition: athletics_comp,
                                  age_range: jw,
                                  title: "800m",
                                  capacity: 1)

hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "relay",
                                    capacity: 4)

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "relay",
                                    capacity: 4)

hundered_meters_jm = Event.create(competition: athletics_comp,
                                  age_range: jm,
                                  title: "relay",
                                  capacity: 4)

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "relay",
                                    capacity: 4)

hundered_meters_jw = Event.create(competition: athletics_comp,
                                  age_range: jw,
                                  title: "relay",
                                  capacity: 4)

c1 = Cadet.create(firstname: "Joe",
                  lastname: "Bloogs",
                  dob: Date.new(2009, 5, 5 ),
                  rank: "Cdt",
                  cid: "17382784628",
                  competing_category: "male",
                  squadron: u14f)

c2 = Cadet.create(firstname: "Michle",
                  lastname: "Winferry",
                  dob: Date.new(2008, 5, 5 ),
                  rank: "Cdt",
                  cid: "173823434628",
                  competing_category: "male",
                  squadron: u14f)

c3 = Cadet.create(firstname: "philip",
                  lastname: "schofeild",
                  dob: Date.new(2007, 5, 5 ),
                  rank: "Cdt",
                  cid: "173324324628",
                  competing_category: "male",
                  squadron: u14f)

c4 = Cadet.create(firstname: "oprah",
                  lastname: "lawrence",
                  dob: Date.new(2006, 5, 5 ),
                  rank: "Cdt",
                  cid: "173854584628",
                  competing_category: "male",
                  squadron: u14f)

c5 = Cadet.create(firstname: "steven",
                  lastname: "fry",
                  dob: Date.new(2005, 5, 5 ),
                  rank: "Cdt",
                  cid: "156582784628",
                  competing_category: "male",
                  squadron: u14f)

c6 = Cadet.create(firstname: "jerremy",
                  lastname: "Flemming",
                  dob: Date.new(2004, 5, 5 ),
                  rank: "Cdt",
                  cid: "15654784628",
                  competing_category: "male",
                  squadron: u14f)


c7 = Cadet.create(firstname: "Alan",
                  lastname: "smith",
                  dob: Date.new(2003, 5, 5 ),
                  rank: "Cdt",
                  cid: "173827845448",
                  competing_category: "male",
                  squadron: u14f)

c8 = Cadet.create(firstname: "Tiffany",
                  lastname: "Bloogs",
                  dob: Date.new(2009, 5, 5 ),
                  rank: "Cdt",
                  cid: "175456784628",
                  competing_category: "female",
                  squadron: u14f)

c9 = Cadet.create(firstname: "Emanuel",
                  lastname: "Winferry",
                  dob: Date.new(2008, 5, 5 ),
                  rank: "Cdt",
                  cid: "1754564",
                  competing_category: "female",
                  squadron: u14f)

c10 = Cadet.create(firstname: "Madea",
                  lastname: "schofeild",
                  dob: Date.new(2007, 5, 5 ),
                  rank: "Cdt",
                  cid: "1733456344628",
                  competing_category: "female",
                  squadron: u14f)

c11 = Cadet.create(firstname: "Jackie",
                  lastname: "lawrence",
                  dob: Date.new(2006, 5, 5 ),
                  rank: "Cdt",
                  cid: "174354348",
                  competing_category: "female",
                  squadron: u14f)

c12 = Cadet.create(firstname: "Machile",
                  lastname: "fry",
                  dob: Date.new(2005, 5, 5 ),
                  rank: "Cdt",
                  cid: "134543628",
                  competing_category: "female",
                  squadron: u14f)

c13 = Cadet.create(firstname: "Shanice",
                  lastname: "Flemming",
                  dob: Date.new(2004, 5, 5 ),
                  rank: "Cdt",
                  cid: "17334543428",
                  competing_category: "female",
                  squadron: u14f)


c14 = Cadet.create(firstname: "Florence",
                  lastname: "smith",
                  dob: Date.new(2003, 5, 5 ),
                  rank: "Cdt",
                  cid: "1738275678",
                  competing_category: "female",
                  squadron: u14f)


CadetInterest.create(event: hundered_meters_u17m, cadet: c2)

CadetRegistration.create(event: hundered_meters_u17m, cadet: c1)
