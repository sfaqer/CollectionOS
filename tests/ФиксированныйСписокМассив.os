#Использовать asserts
#Использовать decorator

#Использовать ".."

Перем Рефлектор;               // Рефлектор
Перем ДляКаждогоВыполнилсяРаз; // Количество раз которое выполнился метод ДляКаждого
Перем СписокФикстура;          // Кеш списка фикстуры

&Тест
Процедура ФиксированныйСписокМассивСоздается() Экспорт

	// Когда

	Результат = Новый ФиксированныйСписокМассив;

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированныйСписокМассив");

КонецПроцедуры

&Тест
Процедура ФиксированныйСписокМассивСоздаетсяКопированием() Экспорт

	// Дано
	
	КопируемыйСписок = СписокФикстура();

	// Когда

	Результат = Новый ФиксированныйСписокМассив(КопируемыйСписок);

	// Тогда
	
	Ожидаем.Что(Результат).ИмеетТип("ФиксированныйСписокМассив");

КонецПроцедуры

&Тест
Процедура Итератор() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Итератор();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ЧитающийИтераторМассив");

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт
	
	// Дано

	ДляКаждогоВыполнилсяРаз = 0;

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	ФиксированныйСписокМассив.ДляКаждого(Новый Действие(ЭтотОбъект, "ДействиеДляКаждого"));

	// Тогда

	Ожидаем.Что(ДляКаждогоВыполнилсяРаз).Равно(3);

КонецПроцедуры

&Тест
Процедура Содержит() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Содержит(1);

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура СодержитВсе() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.СодержитВсе(Новый Массив);

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура Пусто() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Пусто();

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ПроцессорКоллекции() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.ПроцессорКоллекции();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ПроцессорКоллекций");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Количество();

	// Тогда

	Ожидаем.Что(Результат).Равно(3);

КонецПроцедуры

&Тест
Процедура Получить() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Получить(1);

	// Тогда

	Ожидаем.Что(Результат).Равно(2);

КонецПроцедуры

&Тест
Процедура Индекс() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.Индекс(2);

	// Тогда

	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура ПоследнийИндекс() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.ПоследнийИндекс(2);

	// Тогда

	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура ВГраница() Экспорт
	
	// Дано

	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.ВГраница();

	// Тогда

	Ожидаем.Что(Результат).Равно(2);

КонецПроцедуры

&Тест
Процедура ВМассив() Экспорт
	
	// Дано
	
	ФиксированныйСписокМассив = Новый ФиксированныйСписокМассив;
	Рефлектор.УстановитьСвойство(
		ФиксированныйСписокМассив,
		"ВнутреннийСписок",
		СписокФикстура()
	);

	// Когда

	Результат = ФиксированныйСписокМассив.ВМассив();

	// Тогда

	Ожидаем.Что(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(3)
		.Содержит(1)
		.Содержит(2)
		.Содержит(3);
	
КонецПроцедуры

Процедура ДействиеДляКаждого(Элемент) Экспорт // BSLLS:UnusedParameters-off
	ДляКаждогоВыполнилсяРаз = ДляКаждогоВыполнилсяРаз + 1;	
КонецПроцедуры

Функция СписокФикстура()
	
	Если СписокФикстура <> Неопределено Тогда
		Возврат СписокФикстура;
	КонецЕсли;

	Коллекция = Новый Массив;
	Коллекция.Добавить(1);
	Коллекция.Добавить(2);
	Коллекция.Добавить(3);

	ПолеМассив = Новый Поле("Массив")
		.Публичное()
		.ЗначениеПоУмолчанию(Коллекция);

	МетодИтератор = Новый Метод("Итератор")
		.Публичный()
		.ТелоМетода("Возврат Новый ИтераторМассив(Массив, ЭтотОбъект);");

	МетодДляКаждого = Новый Метод("ДляКаждого")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Алгоритм"))
		.ТелоМетода("
		|	Для каждого Элемент Из Массив Цикл
		|		Алгоритм.Выполнить(Элемент);
		|	КонецЦикла;
		|");

	ПараметрМетодаЭлемент = Новый ПараметрМетода("Элемент");

	МетодСодержит = Новый Метод("Содержит")
		.Публичный()
		.Параметр(ПараметрМетодаЭлемент)
		.ТелоМетода("Возврат Истина;");

	МетодСодержитВсе = Новый Метод("СодержитВсе")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Коллекция"))
		.ТелоМетода("Возврат Истина;");

	МетодПусто = Новый Метод("Пусто")
		.Публичный()
		.ТелоМетода("Возврат Ложь;");

	МетодПроцессорКоллекции = Новый Метод("ПроцессорКоллекции")
		.Публичный()
		.ТелоМетода("Возврат ПроцессорыКоллекций.ИзКоллекции(Массив);");

	МетодКоличество = Новый Метод("Количество")
		.Публичный()
		.ТелоМетода("Возврат 3;");

	МетодПолучить = Новый Метод("Получить")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Индекс"))
		.ТелоМетода("Возврат 2;");

	МетодИндекс = Новый Метод("Индекс")
		.Публичный()
		.Параметр(ПараметрМетодаЭлемент)
		.ТелоМетода("Возврат 1;");

	МетодПоследнийИндекс = Новый Метод("ПоследнийИндекс")
		.Публичный()
		.Параметр(ПараметрМетодаЭлемент)
		.ТелоМетода("Возврат 1;");

	МетодВГраница = Новый Метод("ВГраница")
		.Публичный()
		.ТелоМетода("Возврат 2;");

	МетодВМассив = Новый Метод("ВМассив")
		.Публичный()
		.ТелоМетода("Возврат Массив;");

	СписокФикстура = Новый ПостроительДекоратора()
		.Поле(ПолеМассив)
		.Метод(МетодИтератор)
		.Метод(МетодДляКаждого)
		.Метод(МетодСодержит)
		.Метод(МетодСодержитВсе)
		.Метод(МетодПусто)
		.Метод(МетодПроцессорКоллекции)
		.Метод(МетодКоличество)
		.Метод(МетодПолучить)
		.Метод(МетодИндекс)
		.Метод(МетодПоследнийИндекс)
		.Метод(МетодВГраница)
		.Метод(МетодВМассив)
		.Построить();

	Возврат СписокФикстура;

КонецФункции

Рефлектор = Новый Рефлектор();
