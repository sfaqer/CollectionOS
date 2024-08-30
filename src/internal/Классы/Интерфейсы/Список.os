// BSLLS:FunctionShouldHaveReturn-off

// Вставляет элемент в список по индексу
//
// Параметры:
//   Индекс - Число - Индекс, по которому будет вставлен элемент
//   Элемент - Произвольный - Вставляемый элемент
//
//  Возвращаемое значение:
//   Булево - Истина, если элемент вставлен
//
Функция Вставить(Индекс, Элемент) Экспорт
КонецФункции

// Вставляет все элементы из коллекции начиная с индекса
//
// Параметры:
//   Индекс - Число - Индекс, начиная с которого будет вставлены элементы 
//   Коллекция - ЧитаемыйКоллекция - Коллекция, из которой будут вставлены элементы
//
//  Возвращаемое значение:
//   Булево - Истина, если был вставлен хотя бы один элемент
//
Функция ВставитьВсе(Индекс, Коллекция) Экспорт
КонецФункции

// Заменяет все элементы в списке через алгоритм
//
// Параметры:
//   Алгоритм - Действие - Делегат на функцию с одним параметром, в которую передаётся
//    элемент списка, и которая возвращает новое значение элемента
//            - Строка - Лямбда выражение с одним параметром, в который передаётся
//    элемент списка, и которая возвращает новое значение элемента
//
// Пример:
//    Список.ЗаменитьВсе("Элемент -> Элемент + 1");
//
Процедура ЗаменитьВсе(Алгоритм) Экспорт
КонецПроцедуры

// Сортирует список в соответствии с переданным алгоритмом
//
// Параметры:
//   СравнениеЗначений - Действие - Делегат на функцию с двумя параметрами
//    в которую передаются 2 элемента коллекции, и которая возвращает число
//      1 - Если первый элемент больше,
//     -1 - Если второй элемент больше,
//      0 - Если элементы равны
//                     - Строка - Лямбда выражение с двумя параметрами
//    в которую передаются 2 элемента коллекции, и которая возвращает число
//      1 - Если первый элемент больше,
//     -1 - Если второй элемент больше,
//      0 - Если элементы равны
//
// Пример:
//    Список.Сортировать("Первый, Второй -> {
//        | Если Первый > Второй Тогда
//        |     Возврат 1;
//        | ИначеЕсли Второй > Первый Тогда
//        |     Возврат -1;
//        | Иначе
//        |     Возврат 0;
//        | КонецЕсли;
//        |}"
//    );
//
Процедура Сортировать(СравнениеЗначений) Экспорт
КонецПроцедуры

// Удаляет элемент списка по индексу
//
// Параметры:
//   Индекс - Число - Индекс удаляемого элемента
//
//  Возвращаемое значение:
//   Произвольный - Значение которое было удалено
//
Функция УдалитьПоИндексу(Индекс) Экспорт
КонецФункции

// Устанавливает значение по индексу
//
// Параметры:
//   Индекс - Число - Индекс устанавливаемого элемента
//   Значение - Произвольный - Устанавливаемый элемент
//
//  Возвращаемое значение:
//   Произвольный - Значение которое было заменено
//
Функция Установить(Индекс, Значение) Экспорт
КонецФункции

&Интерфейс
&Наследует("ЧитаемыйСписок")
&Наследует("Коллекция")
Процедура ПриСозданииОбъекта()
	ВызватьИсключение "Нельзя создать экземпляр интерфейса";
КонецПроцедуры
