# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'admin',
   email: 'admin@admin',
   password: 'testtest'
)

EndUser.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password'},
    {email: 'james@test.com', name: 'James', password: 'password'},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password'}
  ]
)

 HopeShift.create!(
   [
     {date: '2022-11-20', is_active: true, working_time_start: '9', working_time_end: '18', end_user_id: 1 },
     {date: '2022-11-21', is_active: true, working_time_start: '8', working_time_end: '17', end_user_id: 2 },
     {date: '2022-11-22', is_active: true, working_time_start: '9', working_time_end: '18', end_user_id: 3 },
     {date: '2022-11-21', is_active: true, working_time_start: '9', working_time_end: '18', end_user_id: 1 },
     {date: '2022-11-22', is_active: true, working_time_start: '9', working_time_end: '18', end_user_id: 2 },
     {date: '2022-11-23', is_active: true, working_time_start: '8', working_time_end: '17', end_user_id: 3 }
   ]
 )

Shift.create!(
  [
    {date: '2022-11-20', working_time_start: '9', working_time_end: '18', break_time_start: '13', break_time_end: '14', hope_shift_id: 1 , admin_id: 1},
    {date: '2022-11-21', working_time_start: '8', working_time_end: '17', break_time_start: '12', break_time_end: '13', hope_shift_id: 2 , admin_id: 1},
    {date: '2022-11-22', working_time_start: '9', working_time_end: '18', break_time_start: '14', break_time_end: '15', hope_shift_id: 3 , admin_id: 1},
    {date: '2022-11-21', working_time_start: '9', working_time_end: '18', break_time_start: '13', break_time_end: '14', hope_shift_id: 4, admin_id: 1},
    {date: '2022-11-22', working_time_start: '9', working_time_end: '18', break_time_start: '12', break_time_end: '13', hope_shift_id: 5, admin_id: 1},
    {date: '2022-11-23', working_time_start: '8', working_time_end: '17', break_time_start: '12', break_time_end: '13', hope_shift_id: 6, admin_id: 1},
  ]
)