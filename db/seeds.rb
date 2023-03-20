new_users = [
  User.create(first_name: 'Ivan', email: 'bla@foo.com', password: 'qwerty'),
  User.create(first_name: 'Mira', email: 'mira@bla.com', password: 'qwerty'),
  User.create(first_name: 'Marsi', email: 'marsi@bla.com', password: 'qwerty')
]

questions_and_answers = {
  general: [
    { question: 'Is 1 byte the minimum unit of information?', right_answer: 'No', incorrect_anwer: 'Yes' },
    { question: 'True/False - what type of data is it?', right_answer: 'Boolean', incorrect_anwer: 'Vegetable' },
    { question: 'Conscious data about the world around us, which is the object of storage,
      transformation, transmission and use - what is the name of this term?', right_answer: 'Information', incorrect_anwer: 'Phylosophy' }
  ],
  ruby: [
    { question: 'Is Ruby an object-oriented programming language?', right_answer: 'Yes', incorrect_anwer: 'No' },
    { question: 'What is an object in Ruby?', right_answer: 'Everything', incorrect_anwer: 'Block' },
    { question: 'What is the extension of the file written in Ruby?', right_answer: '.rb', incorrect_anwer: '.js'}
 ],
  rails: [
    {question: 'In what year was Rails released?', right_answer: '2004', incorrect_anwer: '1992'},
    {question: 'What architectural pattern does Rails implement?', right_answer: 'MVC', incorrect_anwer: 'RVM'},
    {question: 'What is more important in Rails, conventions or configurations?', right_answer: 'Conventions', incorrect_anwer: 'Configurations'}
  ]
}

questions_and_answers.keys.each_with_index do |name, index|
  category = Category.create(title: name)
  test = new_users[index].tests.create(title: name, level: index, category_id: category.id, creator_id: new_users[index].id)
  questions_and_answers.fetch(name).each do |hash|
    question = Question.create(body: hash[:question], test_id: test.id)
    Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
    Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
  end
end
