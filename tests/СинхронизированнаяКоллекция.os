#Использовать asserts

#Использовать ".."
#Использовать "./ТестМодуль"

Перем ПроверяемоеЧисло; // Переменная в которую пишут фоновые задания

&Тест
Процедура СинхронизированнаяКоллекцияСоздаётся() Экспорт

	// Дано

	// Когда

	Результат = Новый СинхронизированнаяКоллекция(Новый СписокМассив);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("СинхронизированнаяКоллекция");

КонецПроцедуры

&Тест
Процедура Итератор() Экспорт

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(Новый СписокМассив);

	// Когда

	Результат = ПроверяемаяКоллекция.Итератор();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("СписокИтераторМассив");

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт

	ПроверяемоеЧисло = 0;

	// Дано
	
	СписокМассив = Новый СписокМассив();
	
	// BSLLS:DuplicatedInsertionIntoCollection-off
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(1); 
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(1);
	// BSLLS:DuplicatedInsertionIntoCollection-on
	
	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДляКаждого",
		Новый Действие(ЭтотОбъект, "ДобавитьКПроверяемомуЧислу")
	);

	// Тогда

	Ожидаем.Что(ПроверяемоеЧисло).Равно(25);

КонецПроцедуры

&Тест
Процедура Содержит() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Содержит",
		2
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура СодержитВсе() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	ПроверяющаяКоллекция = Новый СписокМассив();
	ПроверяющаяКоллекция.Добавить(1);
	ПроверяющаяКоллекция.Добавить(2);
	ПроверяющаяКоллекция.Добавить(3);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"СодержитВсе",
		ПроверяющаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура Пусто() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Пусто"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоЛожь();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура ПроцессорКоллекции() Экспорт

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(Новый СписокМассив);

	// Когда

	Результат = ПроверяемаяКоллекция.ПроцессорКоллекции();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ПроцессорКоллекций");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Количество"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).Равно(3);
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура ВМассив() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ВМассив"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		
		Ожидаем.Что(Результат)
			.ИмеетТип("Массив")
			.ИмеетДлину(3)
			.Содержит(1)
			.Содержит(2)
			.Содержит(3);

	КонецЦикла;

КонецПроцедуры

&Тест
Процедура Добавить() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Добавить",
		5
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

	Ожидаем.Что(СписокМассив).ИмеетДлину(5);
	Ожидаем.Что(СписокМассив.Индекс(5)).Равно(0);
	Ожидаем.Что(СписокМассив.ПоследнийИндекс(5)).Равно(4);

КонецПроцедуры

&Тест
Процедура ДобавитьВсе() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	ДобавляемаяКоллекция = Новый СписокМассив();
	ДобавляемаяКоллекция.Добавить(1);
	ДобавляемаяКоллекция.Добавить(2);
	ДобавляемаяКоллекция.Добавить(3);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДобавитьВсе",
		ДобавляемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

	Ожидаем.Что(СписокМассив).ИмеетДлину(15);

КонецПроцедуры

&Тест
Процедура Очистить() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();

	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Очистить"
	);

	// Тогда

	Ожидаем.Что(СписокМассив).ИмеетДлину(0);

КонецПроцедуры

&Тест
Процедура Удалить() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Удалить",
		2
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(СписокМассив).ИмеетДлину(2);

КонецПроцедуры

&Тест
Процедура УдалитьВсе() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	УдаляемаяКоллекция = Новый СписокМассив();
	УдаляемаяКоллекция.Добавить(1);
	УдаляемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"УдалитьВсе",
		УдаляемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(СписокМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура УдалитьЕсли() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"УдалитьЕсли",
		Новый Действие(ЭтотОбъект, "БольшеИлиРавноДвум")
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(СписокМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура СохранитьВсе() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);

	СохраняемаяКоллекция = Новый СписокМассив();
	СохраняемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"СохранитьВсе",
		СохраняемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(СписокМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура ПреставлениеПереопределяется() Экспорт

	// Дано

	СписокМассив = Новый СписокМассив();
	СписокМассив.Добавить(1);
	СписокМассив.Добавить(2);
	СписокМассив.Добавить(ТестМодуль.ОбъектЗаглушка());

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(СписокМассив);
	ПроверяемаяКоллекция.Добавить(ПроверяемаяКоллекция); // BSLLS:SelfInsertion-off Тестовый случай

	// Когда
	
	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ТестМодуль,
		"ВСтроку",
		ПроверяемаяКоллекция
	);

	// Тогда

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат)
			.Равно("[1, 2, Заглушка, (Эта коллекция)]");
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура ОбходитсяЦикломДляКаждого() Экспорт

	Если Не ТестМодуль.ЭтоДвижокВерсии2() Тогда
		Возврат;
	КонецЕсли;

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированнаяКоллекция(Списки.ИзЭлементов(1, 2));

	// Когда

	// Тогда

	Для каждого Элемент Из ПроверяемаяКоллекция Цикл

		Ожидаем.Что(Элемент)
			.БольшеИлиРавно(1)
			.МеньшеИлиРавно(2);

	КонецЦикла;

КонецПроцедуры

Функция БольшеИлиРавноДвум(Элемент) Экспорт
	Два = 2;
	Возврат Элемент >= Два;
КонецФункции

Процедура ДобавитьКПроверяемомуЧислу(Элемент) Экспорт
	ПроверяемоеЧисло = ПроверяемоеЧисло + Элемент;
КонецПроцедуры
