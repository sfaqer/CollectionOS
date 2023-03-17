// BSLLS:FunctionShouldHaveReturn-off

// Проверяет что карта содержит переданный ключ
//
// Параметры:
//   Ключ - Произвольный - Проверяемый ключ
//
//  Возвращаемое значение:
//   Булево - Истина, если карта содержит указанный ключ
//
Функция СодержитКлюч(Ключ) Экспорт
КонецФункции

// Проверяет что карта содержит указанное значение
//
// Параметры:
//   Значение - Произвольный - Проверяемое значение
//
//  Возвращаемое значение:
//   Булево - Истина, если карта содержит указанное значение
//
Функция СодержитЗначение(Значение) Экспорт
КонецФункции

// Выполняет переданное действие для каждого элемента карты
//
// Параметры:
//   Алгоритм - Действие - Делегат на метод с двумя параметрами который будет выполнятся
//    в первый параметр передаёт ключ во второй значение
//
Процедура ДляКаждого(Алгоритм) Экспорт
КонецПроцедуры

// Возвращает значение по ключу карты
//
// Параметры:
//   Ключ - Произвольный - Ключ, по которому требуется получить значение
//
//  Возвращаемое значение:
//   Опциональный<Произвольный> - Опциональный, в котором содержится полученное значение или
//    пустой опциональный, если карта не содержит указанного ключа
//
Функция Получить(Ключ) Экспорт
КонецФункции

// Возвращает значение по ключу карты, или ЗначениеПоУмолчанию если карта не содержит ключ
//
// Параметры:
//   Ключ - Произвольный - Ключ, по которому требуется получить значение
//   ЗначениеПоУмолчанию - Произвольный - Значение, которое будет возвращено если карта не содержит ключ
//
//  Возвращаемое значение:
//   Произвольный<Произвольный> - Значение полученное по ключу карты, или ЗначениеПоУмолчанию если карта не содержит ключ
//
Функция ПолучитьИлиУмолчание(Ключ, ЗначениеПоУмолчанию) Экспорт
КонецФункции

// Возвращает признак того что карта не содержит пар КлючИЗначение
//
//  Возвращаемое значение:
//   Булево - Истина, если карта не содержит пар КлючИЗначение
//
Функция Пусто() Экспорт
КонецФункции

// Возвращает множество ключей содержащихся в карте
//
//  Возвращаемое значение:
//   ЧитаемоеМножество - Множество ключей содержащихся в карте
//
Функция Ключи() Экспорт
КонецФункции

// Возвращает коллекцию значений содержащихся в карте
//
//  Возвращаемое значение:
//   ЧитаемаяКоллекция - Коллекция значений содержащихся в карте
//
Функция Значения() Экспорт
КонецФункции

// Возвращает множество пар КлючИЗначение содержащихся в карте
//
//  Возвращаемое значение:
//   ЧитаемоеМножество - Множество пар КлючИЗначение содержащихся в карте
//
Функция КлючиИЗначения() Экспорт
КонецФункции

// Возвращает количество пар КлючИЗначение содержащихся в карте
//
//  Возвращаемое значение:
//   Число - Количество пар КлючИЗначение содержащихся в карте
//
Функция Количество() Экспорт
КонецФункции

&Интерфейс
Процедура ПриСозданииОбъекта()
	ВызватьИсключение "Нельзя создать экземпляр интерфейса";
КонецПроцедуры
