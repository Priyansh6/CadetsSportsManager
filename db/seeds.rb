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
                       before: Date.new(2023, 8, 31) - 15.years,
                       after: Date.new(2023, 8, 31),
                       competing_category: "male",
                       display_name: "Under 15s Boys")

u17m = AgeRange.create(competition: athletics_comp,
                       before: Date.new(2023, 8, 31) - 17.years,
                       after: Date.new(2023, 8, 31) - 15.years - 1.day,
                       competing_category: "male",
                       display_name: "Under 17s Boys")

jm = AgeRange.create(competition: athletics_comp,
                       before: Date.new(2023, 8, 31) - 15.years,
                       after: Date.new(2023, 8, 31) - 17.years - 1.day,
                       competing_category: "male",
                       display_name: "Junior Mens")

u15f = AgeRange.create(competition: athletics_comp,
                       before: Date.new(2023, 8, 31) - 15.years,
                       after: Date.new(2023, 8, 31),
                       competing_category: "female",
                       display_name: "Under 15s Girls")

jw = AgeRange.create(competition: athletics_comp,
                       before: Date.new(2023, 8, 31) - 15.years,
                       after: Date.new(2023, 8, 31) - 15.years - 1.day,
                       competing_category: "female",
                       display_name: "Junior Women's")


hundered_meters_u15m = Event.create(competition: athletics_comp,
                                    age_range: u15m,
                                    title: "100m")

hundered_meters_u17m = Event.create(competition: athletics_comp,
                                    age_range: u17m,
                                    title: "100m")

hundered_meters_jm = Event.create(competition: athletics_comp,
                                    age_range: jm,
                                    title: "100m")

hundered_meters_u15f = Event.create(competition: athletics_comp,
                                    age_range: u15f,
                                    title: "100m")

hundered_meters_jw = Event.create(competition: athletics_comp,
                                    age_range: jw,
                                    title: "100m")


