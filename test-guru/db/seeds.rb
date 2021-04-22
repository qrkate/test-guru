users = User.seed_create(
  { name: 'Kate', login: 'qrkate', password: 'kkk555' },
  { name: 'Diana', login: 'di5', password: '12345' },
  { name: 'Max', login: 'maxx', password: 'm1a2x3' }
  )

categories = Category.seed_create(
  { title: 'Frontend' },
  { title: 'Backend' }
  )

tests = Test.seed_create(
  { title: 'Ruby', category_id: categories[1].id, author_id: users[0].id },
  { title: 'HTML', category_id: categories[0].id, author_id: users[1].id },
  { title: 'SQL', level: 2, category_id: categories[1].id, author_id: users[0].id },
  { title: 'CSS', level: 1, category_id: categories[0].id, author_id: users[2].id }
  )

questions = Question.seed_create(
  { body: 'Что такое class?', test_id: tests[0].id },
  { body: 'Назовите модификаторы доступа в Ruby.', test_id: tests[0].id },
  { body: 'Как писать комментарии в HTML-коде?', test_id: tests[1].id },
  { body: 'Что такое Image Map?', test_id: tests[1].id },
  { body: 'Важен ли в составном индексе порядок столбцов?', test_id: tests[2].id },
  { body: 'В чем разница между однорядными и многорядными функциями?', test_id: tests[2].id },
  { body: 'Какое свойство позволяет вам спрятать элемент, но сохранить занимаемое им пространство на странице?', test_id: tests[3].id },
  { body: 'Какой селектор позволяет вам обратиться к каждому элементу веб-страницы?', test_id: tests[3].id }
  )

Answer.seed_create(
  { body: 'Это объекты являющиеся экземплярами класса Class.', question_id: questions[0].id },
  { body: 'Public, private, protected.', question_id: questions[1].id },
  { body: 'Текст комментария нужно поместить внутри <!-- и -->.', question_id: questions[2].id },
  { body: 'Это технология, которая позволяет привязывать ссылки к фрагментам изображения.', question_id: questions[3].id },
  { body: 'Важен. Когда строится составной индекс, сначала индексируется первый столбец, а потом строятся индексы других столбцов, на основании главного (первого).', question_id: questions[4].id },
  { body: 'Однорядные функции одновременно работают только с одной строкой, а многорядные функции – с данными из нескольких строк.', question_id: questions[5].id },
  { body: 'Visibility или opacity.', question_id: questions[6].id },
  { body: 'Универсальный селектор (*).', question_id: questions[7].id }
  )
