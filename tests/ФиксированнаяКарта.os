#Использовать asserts
#Использовать decorator

#Использовать ".."

Перем Рефлектор;               // Рефлектор
Перем ДляКаждогоВыполнилсяРаз; // Количество раз которое выполнился метод ДляКаждого
Перем КартаФикстура;           // Кеш карты фикстуры

&Тест
Процедура ФиксированнаяКартаСоздается() Экспорт

	// Дано

	// Когда

	Результат = Новый ФиксированнаяКарта();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированнаяКарта");

КонецПроцедуры

&Тест
Процедура СодержитКлюч() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.СодержитКлюч("1");

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеСодержитКлюч() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.СодержитКлюч("4");

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура СодержитЗначение() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.СодержитЗначение(1);

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеСодержитЗначение() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.СодержитЗначение(4);

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт

	// Дано

	ДляКаждогоВыполнилсяРаз = 0;

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	ПроверяемаяКарта.ДляКаждого(Новый Действие(ЭтотОбъект, "ДействиеДляКаждого"));

	// Тогда

	Ожидаем.Что(ДляКаждогоВыполнилсяРаз).Равно(3);

КонецПроцедуры

&Тест
Процедура ПолучитьСуществует() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.Получить("1");

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

КонецПроцедуры

&Тест
Процедура ПолучитьНеСуществует() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.Получить("4");

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ПолучитьИлиУмолчаниеСуществует() Экспорт

	// Дано
	
	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.ПолучитьИлиУмолчание("1", "ЯНеДолженВернутся");

	// Тогда

	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура ПолучитьИлиУмолчаниеНеСуществует() Экспорт

	// Дано
	
	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.ПолучитьИлиУмолчание("4", 4);

	// Тогда

	Ожидаем.Что(Результат).Равно(4);

КонецПроцедуры

&Тест
Процедура Пусто() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();

	// Когда

	Результат = ПроверяемаяКарта.Пусто();

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеПусто() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.Пусто();

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура Ключи() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.Ключи();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированноеМножествоКлючей");

КонецПроцедуры

&Тест
Процедура Значения() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.Значения();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированнаяКоллекцияЗначений");

КонецПроцедуры

&Тест
Процедура КлючиИЗначения() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = ПроверяемаяКарта.КлючиИЗначения();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированноеМножествоКлючейИЗначений");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт

	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());
	
	// Когда

	Результат = ПроверяемаяКарта.Количество();	

	// Тогда

	Ожидаем.Что(Результат).Равно(3);

КонецПроцедуры

&Тест
Процедура ПреставлениеПереопределяется() Экспорт
	
	// Дано

	ПроверяемаяКарта = Новый ФиксированнаяКарта();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "ВнутренняяКарта", КартаФикстура());

	// Когда

	Результат = Строка(ПроверяемаяКарта);

	// Тогда
	
	Ожидаем.Что(Результат)
		.Равно("{1=1, 2=2, 3=3}");

КонецПроцедуры

Процедура ДействиеДляКаждого(Ключ, Значение) Экспорт // BSLLS:UnusedParameters-off
	ДляКаждогоВыполнилсяРаз = ДляКаждогоВыполнилсяРаз + 1;	
КонецПроцедуры

Функция КартаФикстура()
	
	Если КартаФикстура <> Неопределено Тогда
		Возврат КартаФикстура;
	КонецЕсли;

	Соответствие = Новый Соответствие;
	Соответствие.Вставить("1", 1);
	Соответствие.Вставить("2", 2);
	Соответствие.Вставить("3", 3);

	ПолеСоответствие = Новый Поле("Соответствие")
		.ЗначениеПоУмолчанию(Соответствие);

	ПараметрМетодаКлюч = Новый ПараметрМетода("Ключ");

	МетодСодержитКлюч = Новый Метод("СодержитКлюч")
		.Публичный()
		.Параметр(ПараметрМетодаКлюч)
		.ТелоМетода("Возврат Соответствие.Получить(Ключ) <> Неопределено;");

	МетодСодержитЗначение = Новый Метод("СодержитЗначение")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Значение"))
		.ТелоМетода(
			"Для каждого КиЗ из Соответствие Цикл
			|	Если КиЗ.Значение = Значение Тогда
			|		Возврат Истина;
			|	КонецЕсли;
			|КонецЦикла;
			|
			|Возврат Ложь;"
		);

	МетодДляКаждого = Новый Метод("ДляКаждого")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Алгоритм"))
		.Параметр(Новый ПараметрМетода("Контекст"))
		.ТелоМетода("
			|Для каждого КиЗ из Соответствие Цикл
			|	Алгоритм.Выполнить(КиЗ.Ключ, КиЗ.Значение);
			|КонецЦикла;"
		);	

	МетодПолучить = Новый Метод("Получить")
		.Публичный()
		.Параметр(ПараметрМетодаКлюч)
		.ТелоМетода("Возврат Новый Опциональный(Соответствие.Получить(Ключ), Истина);");

	МетодПолучитьИлиУмолчание = Новый Метод("ПолучитьИлиУмолчание")
		.Публичный()
		.Параметр(ПараметрМетодаКлюч)
		.Параметр(Новый ПараметрМетода("ЗначениеПоУмолчанию"))
		.ТелоМетода(
			"Возврат ?(
			|	Соответствие.Получить(Ключ) = Неопределено,
			|	ЗначениеПоУмолчанию,
			|	Соответствие.Получить(Ключ)
			|)"
		);

	МетодПусто = Новый Метод("Пусто")
		.Публичный()
		.ТелоМетода("Возврат Ложь;");

	МетодКлючи = Новый Метод("Ключи")
		.Публичный()
		.ТелоМетода("Возврат Новый ФиксированноеМножествоКлючей(Соответствие, ЭтотОбъект);");
	
	МетодЗначения = Новый Метод("Значения")
		.Публичный()
		.ТелоМетода("Возврат Новый ФиксированнаяКоллекцияЗначений(Соответствие, ЭтотОбъект);");

	МетодКлючиИЗначения = Новый Метод("КлючиИЗначения")
		.Публичный()
		.ТелоМетода("Возврат Новый ФиксированноеМножествоКлючейИЗначений(Соответствие, ЭтотОбъект);");

	МетодКоличество = Новый Метод("Количество")
		.Публичный()
		.ТелоМетода("Возврат 3;");

	КартаФикстура = Новый ПостроительДекоратора()
		.Поле(ПолеСоответствие)
		.Метод(МетодСодержитКлюч)
		.Метод(МетодСодержитЗначение)
		.Метод(МетодДляКаждого)
		.Метод(МетодПолучить)
		.Метод(МетодПолучитьИлиУмолчание)
		.Метод(МетодПусто)
		.Метод(МетодКлючи)
		.Метод(МетодЗначения)
		.Метод(МетодКлючиИЗначения)
		.Метод(МетодКоличество)
		.Построить();

	Возврат КартаФикстура;

КонецФункции

Рефлектор = Новый Рефлектор;
