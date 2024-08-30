#Использовать asserts

#Использовать ".."
#Использовать "./ТестМодуль"

Перем ПроверяемоеЧисло; // Переменная в которую пишут фоновые задания

&Тест
Процедура СинхронизированноеМножествоСоздаётся() Экспорт

	// Дано

	// Когда

	Результат = Новый СинхронизированноеМножество(Новый МножествоСоответствие);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("СинхронизированноеМножество");

КонецПроцедуры

&Тест
Процедура Итератор() Экспорт

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(Новый МножествоСоответствие);

	// Когда

	Результат = ПроверяемаяКоллекция.Итератор();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ИтераторКлючСоответствие");

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт

	ПроверяемоеЧисло = 0;

	// Дано
	
	МножествоСоответствие = Новый МножествоСоответствие();
	
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2); 
	МножествоСоответствие.Добавить(3);
	МножествоСоответствие.Добавить(4);
	МножествоСоответствие.Добавить(5);
	
	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДляКаждого",
		Новый Действие(ЭтотОбъект, "ДобавитьКПроверяемомуЧислу")
	);

	// Тогда

	Ожидаем.Что(ПроверяемоеЧисло).Равно(75);

КонецПроцедуры

&Тест
Процедура Содержит() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	ПроверяющаяКоллекция = Новый МножествоСоответствие();
	ПроверяющаяКоллекция.Добавить(1);
	ПроверяющаяКоллекция.Добавить(2);
	ПроверяющаяКоллекция.Добавить(3);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(Новый МножествоСоответствие);

	// Когда

	Результат = ПроверяемаяКоллекция.ПроцессорКоллекции();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ПроцессорКоллекций");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	МножествоСоответствие = Новый МножествоСоответствие();

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Добавить",
		5
	);

	// Тогда

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

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(1);
	Ожидаем.Что(МножествоСоответствие.Содержит(5)).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура ДобавитьВсе() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	ДобавляемаяКоллекция = Новый МножествоСоответствие();
	ДобавляемаяКоллекция.Добавить(1);
	ДобавляемаяКоллекция.Добавить(2);
	ДобавляемаяКоллекция.Добавить(3);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДобавитьВсе",
		ДобавляемаяКоллекция
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
	
	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(3);

КонецПроцедуры

&Тест
Процедура Очистить() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();

	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Очистить"
	);

	// Тогда

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(0);

КонецПроцедуры

&Тест
Процедура Удалить() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(2);

КонецПроцедуры

&Тест
Процедура УдалитьВсе() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	УдаляемаяКоллекция = Новый МножествоСоответствие();
	УдаляемаяКоллекция.Добавить(1);
	УдаляемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура УдалитьЕсли() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура СохранитьВсе() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);

	СохраняемаяКоллекция = Новый МножествоСоответствие();
	СохраняемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ВыполнитьВПятьПотоков(
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

	Ожидаем.Что(МножествоСоответствие).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура ПреставлениеПереопределяется() Экспорт

	// Дано

	МножествоСоответствие = Новый МножествоСоответствие();
	МножествоСоответствие.Добавить(1);
	МножествоСоответствие.Добавить(2);
	МножествоСоответствие.Добавить(ТестМодуль.ОбъектЗаглушка());

	ПроверяемаяКоллекция = Новый СинхронизированноеМножество(МножествоСоответствие);
	ПроверяемаяКоллекция.Добавить(ПроверяемаяКоллекция); // BSLLS:SelfInsertion-off Тестовый случай

	// Когда
	
	Результаты = ВыполнитьВПятьПотоков(
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

Функция БольшеИлиРавноДвум(Элемент) Экспорт
	Два = 2;
	Возврат Элемент >= Два;
КонецФункции

Процедура ДобавитьКПроверяемомуЧислу(Элемент) Экспорт
	ПроверяемоеЧисло = ПроверяемоеЧисло + Элемент;
КонецПроцедуры

Функция ВыполнитьВПятьПотоков(Сценарий, ИмяМетода, Параметр = Неопределено)
	
	Параметры = Новый Массив;

	Если Не Параметр = Неопределено Тогда
		Параметры.Добавить(Параметр);
	КонецЕсли;

	Задания = Новый Массив();

	Для Счетчик = 1 По 5 Цикл // BSLLS:UnusedLocalVariable-off

		Задания.Добавить(
			ФоновыеЗадания.Выполнить(Сценарий, ИмяМетода, Параметры)
		);

	КонецЦикла;

	ФоновыеЗадания.ОжидатьЗавершенияЗадач();

	Результаты = Новый Массив;

	Для каждого ФоновоеЗадание Из Задания Цикл
		Результаты.Добавить(ФоновоеЗадание.Результат);
	КонецЦикла;

	ФоновыеЗадания.Очистить();

	Возврат Результаты;

КонецФункции
