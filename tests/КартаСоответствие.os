#Использовать asserts
#Использовать decorator

#Использовать ".."

Перем Рефлектор;               // Рефлектор
Перем ДляКаждогоВыполнилсяРаз; // Количество раз которое выполнился метод ДляКаждого
Перем КоллекцияМодифицирована; // Признак того что мутатор вызвал оповещение об изменении

Процедура КоллекцияМодифицирована() // BSLLS:UnusedLocalMethod-off
	КоллекцияМодифицирована = Истина;
КонецПроцедуры

&Тест
Процедура КартаСоответствиеСоздается() Экспорт

	// Дано

	// Когда

	Результат = Новый КартаСоответствие();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("КартаСоответствие");

КонецПроцедуры

&Тест
Процедура СодержитКлюч() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.СодержитКлюч("1");

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеСодержитКлюч() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.СодержитКлюч("4");

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура СодержитЗначение() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.СодержитЗначение(1);

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеСодержитЗначение() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.СодержитЗначение(4);

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт

	// Дано

	ДляКаждогоВыполнилсяРаз = 0;

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	ПроверяемаяКарта.ДляКаждого(Новый Действие(ЭтотОбъект, "ДействиеДляКаждого"));

	// Тогда

	Ожидаем.Что(ДляКаждогоВыполнилсяРаз).Равно(3);

КонецПроцедуры

&Тест
Процедура ПолучитьСуществует() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

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

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.Получить("4");

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ПолучитьИлиУмолчаниеСуществует() Экспорт

	// Дано
	
	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.ПолучитьИлиУмолчание("1", "ЯНеДолженВернутся");

	// Тогда

	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура ПолучитьИлиУмолчаниеНеСуществует() Экспорт

	// Дано
	
	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.ПолучитьИлиУмолчание("4", 4);

	// Тогда

	Ожидаем.Что(Результат).Равно(4);

КонецПроцедуры

&Тест
Процедура Пусто() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();

	// Когда

	Результат = ПроверяемаяКарта.Пусто();

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура НеПусто() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.Пусто();

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура Ключи() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.Ключи();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированноеМножествоКлючей");

КонецПроцедуры

&Тест
Процедура Значения() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.Значения();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированнаяКоллекцияЗначений");

КонецПроцедуры

&Тест
Процедура КлючиИЗначения() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());

	// Когда

	Результат = ПроверяемаяКарта.КлючиИЗначения();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ФиксированноеМножествоКлючейИЗначений");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие());
	
	// Когда

	Результат = ПроверяемаяКарта.Количество();	

	// Тогда

	Ожидаем.Что(Результат).Равно(3);

КонецПроцедуры

&Тест
Процедура Очистить() Экспорт

	// Дано
	
	КоллекцияМодифицирована = Ложь;

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	ПроверяемаяКарта.Очистить();

	// Тогда

	Ожидаем.Что(Соответствие).ИмеетДлину(0);
	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВставитьНовый() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Вставить("4", 4);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(4);
	Ожидаем.Что(Соответствие.Получить("4")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВставитьСуществующий() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);

	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Вставить("1", 4);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВставитьНеопределено() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();

	Параметры = Новый Массив;

	Параметры.Добавить(Неопределено);
	Параметры.Добавить(Неопределено);

	// Когда

	// Тогда

	Ожидаем.Что(ПроверяемаяКарта)
		.Метод("Вставить", Параметры)
		.ВыбрасываетИсключение("Неопределено не может быть в качестве ключа или значения карты");

КонецПроцедуры

&Тест
Процедура ВставитьВсе() Экспорт

	// Дано

	ПроверяемаяКарта = Новый КартаСоответствие();
	Соответствие = Рефлектор.ПолучитьСвойство(ПроверяемаяКарта, "Соответствие");

	КартаВставляемая = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(КартаВставляемая, "Соответствие", Соответствие());

	// Когда

	ПроверяемаяКарта.ВставитьВсе(КартаВставляемая);

	// Тогда

	Ожидаем.Что(Соответствие)
		.ИмеетДлину(3)
		.Содержит(1)
		.Содержит(2)
		.Содержит(3);

КонецПроцедуры

&Тест
Процедура ВставитьЕслиОтсутствуетКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВставитьЕслиОтсутствует("4", 4);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(4);
	Ожидаем.Что(Соответствие.Получить("4")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВставитьЕслиОтсутствуетКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВставитьЕслиОтсутствует("1", 4);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(1);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ВычислитьБезусловноКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьБезусловно("1", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(2);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(2);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьБезусловноКлючСуществуетНовыйНеопределено() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьБезусловно("1", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияНеопределено"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(2);
	Ожидаем.Что(Соответствие.Получить("1")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьБезусловноКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьБезусловно("4", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(4);

	Ожидаем.Что(Соответствие).ИмеетДлину(4);
	Ожидаем.Что(Соответствие.Получить("4")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьБезусловноКлючНеСуществуетНовыйНеопределено() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьБезусловно("4", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияНеопределено"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("4")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиОтсутствуетКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиОтсутствует("1", Новый Действие(
		ЭтотОбъект, "ФункцияНазначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(1);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиОтсутствуетКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиОтсутствует("4", Новый Действие(
		ЭтотОбъект, "ФункцияНазначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(4);

	Ожидаем.Что(Соответствие).ИмеетДлину(4);
	Ожидаем.Что(Соответствие.Получить("4")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиОтсутствуетКлючНеСуществуетНовыйНеопределено() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиОтсутствует("4", Новый Действие(
		ЭтотОбъект, "ФункцияНазначенияНеопределено"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("4")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиПрисутствуетКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиПрисутствует("1", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(2);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(2);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиПрисутствуетКлючСуществуетНовыйНеопределено() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиПрисутствует("1", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияНеопределено"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(2);
	Ожидаем.Что(Соответствие.Получить("1")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ВычислитьЕслиПрисутствуетКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ВычислитьЕслиПрисутствует("4", Новый Действие(
		ЭтотОбъект, "ФункцияПереназначения"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("4")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура СлитьКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Слить("1", 2, Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияСлить"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(3);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(3);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура СлитьКлючСуществуетНовыйНеопределено() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Слить("1", 2, Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияНеопределено"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(2);
	Ожидаем.Что(Соответствие.Получить("1")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура СлитьКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Слить("4", 4, Новый Действие(
		ЭтотОбъект, "ФункцияПереназначенияСлить"
	));

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(4);

	Ожидаем.Что(Соответствие).ИмеетДлину(4);
	Ожидаем.Что(Соответствие.Получить("4")).Равно(4);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ЗаменитьКлючСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Заменить("1", 5);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(5);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ЗаменитьКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Заменить("4", 5);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("4")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ЗаменитьЕслиЗначениеКлючНеСуществует() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ЗаменитьЕслиЗначение("4", 4, 5);

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("4")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ЗаменитьЕслиЗначениеКлючСуществуетЗначениеНеПодходит() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ЗаменитьЕслиЗначение("1", 4, 5);

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(1);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ЗаменитьЕслиЗначениеКлючСуществуетЗначениеПодходит() Экспорт

	// Дано

	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.ЗаменитьЕслиЗначение("1", 1, 5);

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);
	Ожидаем.Что(Соответствие.Получить("1")).Равно(5);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ЗаменитьВсе() Экспорт

	// Дано
	
	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	ПроверяемаяКарта.ЗаменитьВсе(Новый Действие(ЭтотОбъект, "ФункцияПереназначенияЗаменитьВсе"));

	// Тогда

	Ожидаем.Что(Соответствие).ИмеетДлину(3);

	Ожидаем.Что(Соответствие.Получить("1")).Равно(2);
	Ожидаем.Что(Соответствие.Получить("2")).Равно(4);
	Ожидаем.Что(Соответствие.Получить("3")).Равно(6);

КонецПроцедуры

&Тест
Процедура УдалитьНеСуществует() Экспорт

	// Дано
	
	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Удалить("4");

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоИстина();

	Ожидаем.Что(Соответствие).ИмеетДлину(3);

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура УдалитьСуществует() Экспорт

	// Дано
	
	Соответствие = Соответствие();

	ПроверяемаяКарта = Новый КартаСоответствие();
	Рефлектор.УстановитьСвойство(ПроверяемаяКарта, "Соответствие", Соответствие);
	
	КоллекцияМодифицирована = Ложь;
	ДобавитьОбработчик ПроверяемаяКарта.КоллекцияМодифицирована, КоллекцияМодифицирована;

	// Когда

	Результат = ПроверяемаяКарта.Удалить("1");

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("Опциональный");
	Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Результат.Получить()).Равно(1);

	Ожидаем.Что(Соответствие).ИмеетДлину(2);
	Ожидаем.Что(Соответствие.Получить("1")).ЭтоНеопределено();

	Ожидаем.Что(КоллекцияМодифицирована).ЭтоИстина();

КонецПроцедуры

Процедура ДействиеДляКаждого(Ключ, Значение) Экспорт // BSLLS:UnusedParameters-off
	ДляКаждогоВыполнилсяРаз = ДляКаждогоВыполнилсяРаз + 1;
КонецПроцедуры

Функция ФункцияПереназначения(Ключ, СтароеЗначение) Экспорт

	Если ТипЗнч(СтароеЗначение) = Тип("Опциональный") Тогда
		Значение = ?(СтароеЗначение.Пустой(), 0, СтароеЗначение.Получить());
	Иначе
		Значение = СтароеЗначение;
	КонецЕсли;

	Возврат Число(Ключ) + Значение;

КонецФункции

Функция ФункцияПереназначенияСлить(СтароеЗначение, НовоеЗначение) Экспорт
	Возврат СтароеЗначение + НовоеЗначение;
КонецФункции

Функция ФункцияПереназначенияЗаменитьВсе(Ключ, Значение) Экспорт
	Возврат Число(Ключ) + Значение;
КонецФункции

Функция ФункцияНазначения(Ключ) Экспорт
	Возврат Число(Ключ);
КонецФункции

Функция ФункцияНазначенияНеопределено(Ключ) Экспорт // BSLLS:UnusedParameters-off
	Возврат Неопределено;
КонецФункции

Функция ФункцияПереназначенияНеопределено(Ключ, СтароеЗначение) Экспорт // BSLLS:UnusedParameters-off
	Возврат Неопределено;
КонецФункции

Функция Соответствие()
	
	Результат = Новый Соответствие;

	Результат.Вставить("1", 1);
	Результат.Вставить("2", 2);
	Результат.Вставить("3", 3);

	Возврат Результат;

КонецФункции

Рефлектор = Новый Рефлектор;
