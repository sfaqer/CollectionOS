Перем ДляКаждогоВыполнилсяРаз Экспорт;
Перем СуммаЭлементов Экспорт;

Перем ОбъектЗаглушка;

Функция ОбъектЗаглушка() Экспорт

	Если ОбъектЗаглушка <> Неопределено Тогда
		Возврат ОбъектЗаглушка;
	КонецЕсли;

	МетодОбработкаПолученияПредставления = Новый Метод("ОбработкаПолученияПредставления")
		.Параметр(Новый ПараметрМетода("Представление"))
		.Параметр(Новый ПараметрМетода("СтандартнаяОбработка"))
		.ТелоМетода("СтандартнаяОбработка = Ложь; Представление = ""Заглушка""");

	ОбъектЗаглушка = Новый ПостроительДекоратора()
		.Метод(МетодОбработкаПолученияПредставления)
		.Построить();

	Возврат ОбъектЗаглушка;

КонецФункции

Функция ВСтроку(Параметр) Экспорт
	Возврат Строка(Параметр);
КонецФункции

Функция ЭтоДвижокВерсии2() Экспорт
	Возврат Число(Лев(Новый СистемнаяИнформация.Версия, 1)) >= 2;
КонецФункции

Функция ВыполнитьВПятьПотоков(
	Сценарий,
	ИмяМетода,
	Параметр = Неопределено,
	ВторойПараметр = Неопределено,
	ТретийПараметр = Неопределено) Экспорт
	
	Параметры = Новый Массив;

	Если Не Параметр = Неопределено Тогда
		Параметры.Добавить(Параметр);
	КонецЕсли;

	Если Не ВторойПараметр = Неопределено Тогда
		Параметры.Добавить(ВторойПараметр);
	КонецЕсли;

	Если Не ТретийПараметр = Неопределено Тогда
		Параметры.Добавить(ТретийПараметр);
	КонецЕсли;

	Задания = Новый Массив();

	Для Счетчик = 1 По 5 Цикл // BSLLS:UnusedLocalVariable-off

		Задания.Добавить(
			ФоновыеЗадания.Выполнить(Сценарий, ИмяМетода, Параметры)
		);

	КонецЦикла;

	Попытка
		ФоновыеЗадания.ОжидатьЗавершенияЗадач();
	Исключение

		ИнформацияОбОшибке = ИнформацияОбОшибке();
		Сообщить(ТипЗнч(ИнформацияОбОшибке));
		Если ИнформацияОбОшибке.Параметры <> Неопределено И ИнформацияОбОшибке.Параметры.Количество() > 0 Тогда
			ИнформацияОбОшибке = ИнформацияОбОшибке.Параметры[0].ИнформацияОбОшибке;
		КонецЕсли;

		ФоновыеЗадания.Очистить();

		ВызватьИсключение ПодробноеПредставлениеОшибки(ИнформацияОбОшибке);

	КонецПопытки;

	Результаты = Новый Массив;

	Для каждого ФоновоеЗадание Из Задания Цикл
		Результаты.Добавить(ФоновоеЗадание.Результат);
	КонецЦикла;

	ФоновыеЗадания.Очистить();

	Возврат Результаты;

КонецФункции

ДляКаждогоВыполнилсяРаз = 0;
СуммаЭлементов = 0;
