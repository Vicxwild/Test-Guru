new_users = [
  User.create(first_name: 'Ivan', email: 'bla@foo.com', password: 'qwerty'),
  User.create(first_name: 'Mira', email: 'mira@bla.com', password: 'qwerty'),
  User.create(first_name: 'Marsi', email: 'marsi@bla.com', password: 'qwerty')
]
admin = Admin.create(first_name: 'admin', email: 'admin@admin.com', password: '123qwe')

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
    { question: 'In what year was Rails released?', right_answer: '2004', incorrect_anwer: '1992' },
    { question: 'What architectural pattern does Rails implement?', right_answer: 'MVC', incorrect_anwer: 'RVM' },
    { question: 'What is more important in Rails, conventions or configurations?', right_answer: 'Conventions', incorrect_anwer: 'Configurations' }
  ],
  html: [
    { question: "Как оформляется комментарий в HTML?", right_answer: "<!—- комментарий -->", incorrect_anwer: "/* комментарий */" },
    { question: "Каким является следующий адрес ссылки: ./pages/page2.html?", right_answer: "Относительным", incorrect_anwer: "Абсолютным" },
    { question: "С помощью какого тега нужно задавать подписи к полям формы?", right_answer: "label", incorrect_anwer: "type" }
  ],
  javascript: [
    { question: "Какие циклы есть в языке JavaScript?", right_answer: "for, while, do while", incorrect_anwer: "for, while, do while, foreach" },
    { question: "Какие значения можно хранить в переменных?", right_answer: "Строки, числа с точкой, простые числа и булевые выражения", incorrect_anwer: "Только числа и строки" },
    { question: "Как вызывается объект jQuery?", right_answer: "С помощью символа $", incorrect_anwer: "С помощью символа %" }
  ]
}

# basics test

category = Category.create!(title: "Basics")

test = category.tests.create!(title: "General", level: 1, creator_id: admin.id, published_at: Time.now)

questions_and_answers.fetch(:general).each do |hash|
  question = Question.create(body: hash[:question], test_id: test.id)
  Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
  Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
end

# backend tests

category = Category.create!(title: "Backend")

test = category.tests.create!(title: "Ruby", level: 1, creator_id: admin.id, published_at: Time.now)

questions_and_answers.fetch(:ruby).each do |hash|
  question = Question.create!(body: hash[:question], test_id: test.id)
  Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
  Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
end

test = category.tests.create!(title: "Rails", level: 3, creator_id: admin.id, published_at: Time.now)

questions_and_answers.fetch(:rails).each do |hash|
  question = Question.create!(body: hash[:question], test_id: test.id)
  Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
  Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
end

# frontend tests

category = Category.create!(title: "Frontend")

test = category.tests.create(title: "HTML", level: 2, creator_id: admin.id, published_at: Time.now)

questions_and_answers.fetch(:html).each do |hash|
  question = Question.create(body: hash[:question], test_id: test.id)
  Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
  Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
end

test = category.tests.create(title: "JavaScript", level: 4, creator_id: admin.id, published_at: Time.now)

questions_and_answers.fetch(:javascript).each do |hash|
  question = Question.create(body: hash[:question], test_id: test.id)
  Answer.create(body: hash[:right_answer], correct: true, question_id: question.id)
  Answer.create(body: hash[:incorrect_anwer], question_id: question.id)
end

# badges

badge = Badge.new(
  title: "Backend king",
  description: "For successfully passing all Backend category tests",
  picture_link: "/images/backend.png"
  )
badge.save!

badge = Badge.new(
  title: "Frontend king",
  description: "For successfully passing all Frontend category tests",
  picture_link: "/images/frontend.png"
  )
badge.save!

badge = Badge.new(
  title: "First try",
  description: "For passing the test without errors",
  picture_link: "/images/first-try.png"
  )
badge.save!
