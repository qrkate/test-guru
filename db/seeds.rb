unless Test.exists?
  users = User.create!([
    { name: 'Kate', login: 'qrkate', password: 'kkk555' },
    { name: 'Diana', login: 'di5', password: '12345' },
    { name: 'Max', login: 'maxx', password: 'm1a2x3' }
    ])

  categories = Category.create!([
    { title: 'Frontend' },
    { title: 'Backend' }
    ])

  tests = Test.create!([
    { title: 'Ruby', category: categories[1], author: users[0] },
    { title: 'HTML', category: categories[0], author: users[1] },
    { title: 'SQL', level: 2, category: categories[1], author: users[0] },
    { title: 'CSS', level: 1, category: categories[0], author: users[2] }
    ])

  questions = Question.create!([
    { body: 'Что такое class?', test: tests[0] },
    { body: 'Назовите модификаторы доступа в Ruby.', test: tests[0] },
    { body: 'Как писать комментарии в HTML-коде?', test: tests[1] },
    { body: 'Что такое Image Map?', test: tests[1] },
    { body: 'Важен ли в составном индексе порядок столбцов?', test: tests[2] },
    { body: 'В чем разница между однорядными и многорядными функциями?', test: tests[2] },
    { body: 'Какое свойство позволяет вам спрятать элемент, но сохранить занимаемое им пространство на странице?', test: tests[3] },
    { body: 'Какой селектор позволяет вам обратиться к каждому элементу веб-страницы?', test: tests[3] }
    ])

  Answer.create!([
    { body: 'Это объекты являющиеся экземплярами класса Class.', question: questions[0] },
    { body: 'Public, private, protected.', question: questions[1] },
    { body: 'Текст комментария нужно поместить внутри <!-- и -->.', question: questions[2] },
    { body: 'Это технология, которая позволяет привязывать ссылки к фрагментам изображения.', question: questions[3] },
    { body: 'Важен. Когда строится составной индекс, сначала индексируется первый столбец, а потом строятся индексы других столбцов, на основании главного (первого).', question: questions[4] },
    { body: 'Однорядные функции одновременно работают только с одной строкой, а многорядные функции – с данными из нескольких строк.', question: questions[5] },
    { body: 'Visibility или opacity.', question: questions[6] },
    { body: 'Универсальный селектор (*).', question: questions[7] }
    ])

  PassedTest.create!([
     { user: users[0], test: tests[0] },
     { user: users[0], test: tests[1] },
     { user: users[0], test: tests[2] },
     { user: users[0], test: tests[3] },
     { user: users[1], test: tests[2] },
     { user: users[1], test: tests[1] },
     { user: users[2], test: tests[3] }
     ])
end
