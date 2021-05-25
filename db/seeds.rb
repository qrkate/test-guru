unless Test.exists?
  users = User.create!([
    { first_name: 'Kate', last_name: 'Kr', email: 'qrkate@yandex.ru', password: 'kkk555', type: 'Admin' },
    { first_name: 'Diana', last_name: 'Di', email: 'di5@gmail.com', password: '123456' },
    { first_name: 'Max', last_name: 'M',email: 'maxx@mail.ru', password: 'm1a2x3' }
    ])

  categories = Category.create!([
    { title: 'Frontend' },
    { title: 'Backend' }
    ])

  tests = Test.create!([
    { title: 'Ruby', category: categories[1], author: users[0], timer: 1 },
    { title: 'HTML', category: categories[0], author: users[1] },
    { title: 'SQL', level: 2, category: categories[1], author: users[0], timer: 2 },
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
    { body: 'Это объекты являющиеся экземплярами класса Class.', question: questions[0], correct: true },
    { body: 'Это объекты являющиеся классом Class.', question: questions[0]},
    { body: 'Public, private, protected.', question: questions[1], correct: true },
    { body: 'Public, private.', question: questions[1]},
    { body: 'Текст комментария нужно поместить внутри <!-- и -->.', question: questions[2], correct: true },
    { body: 'Текст комментария нужно поместить внутри "".', question: questions[2] },
    { body: 'Это технология, которая позволяет привязывать ссылки к фрагментам изображения.', question: questions[3], correct: true },
    { body: 'Это технология, которая позволяет привязывать изображения к ссылкам.', question: questions[3]},
    { body: 'Важен.', question: questions[4], correct: true },
    { body: 'Не важен.', question: questions[4] },
    { body: 'Однорядные функции одновременно работают только с одной строкой, а многорядные функции – с данными из нескольких строк.', question: questions[5], correct: true },
    { body: 'Однорядные функции одновременно работают с данными из нескольких строк, а многорядные функции – только с одной строкой.', question: questions[5] },
    { body: 'Visibility.', question: questions[6], correct: true },
    { body: 'Opacity.', question: questions[6], correct: true },
    { body: 'Универсальный селектор (*).', question: questions[7], correct: true },
    { body: 'Универсальный селектор (/).', question: questions[7] }
    ])

  Badge.create!([
    { name: 'Первая попытка', image_url: 'https://www.therpf.com/forums/attachments/publicdomainq-thumb-png.967694/', rule: 'first_try?' },
    { name: 'Backend', image_url: 'https://w7.pngwing.com/pngs/650/298/png-transparent-front-end-web-development-web-developer-front-and-back-ends-software-developer-developer-gadget-electronics-web-application.png', rule: 'all_category?', option: 'Backend' },
    { name: 'Новичок', image_url: 'https://w7.pngwing.com/pngs/958/741/png-transparent-mikecrack-drawing-diamantito-2-raptorgamer-painting-mikecrack-game-child-hand.png', rule: 'all_level?', option: '0' },
    ])
end
