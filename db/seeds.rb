# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create([
  {question: 'Which American state is nearest to the former Soviet Union', answer: 'Alaska'},
  {question: 'Which reggae singing star died 11th May 1981', answer: 'Bob Marley'},
  {question: 'What is converted into alcohol during brewing', answer: 'Sugar'},
  {question: 'Which guitarist is known as Slowhand', answer: 'Eric Clapton'},
  {question: 'Which actor appeared in Papillion and The Great Escape and died in 1980', answer: 'Steve McQueen'},
  {question: 'In which bay is Alcatraz', answer: 'San Francisco Bay'},
  {question: 'In Roman mythology, Neptune is the equivalent to which Greek god', answer: 'Poseidon'},
  ])
