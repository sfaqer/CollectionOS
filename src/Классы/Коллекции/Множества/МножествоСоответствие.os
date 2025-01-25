#Использовать fluent
#Использовать lambdas

#Использовать "../../../internal"

Перем Соответствие;  // Внутреннее соответствие
Перем ЕстьИтераторы; // Признак того что из множества были созданы итераторы

Функция Итератор() Экспорт

	ЕстьИтераторы = Истина;

	Возврат Новый ИтераторКлючСоответствие(Соответствие, ЭтотОбъект);

КонецФункции

Процедура ДляКаждого(Знач Алгоритм, Знач Контекст = Неопределено) Экспорт
	Итератор().ДляКаждогоОставшегося(Алгоритм, Контекст);
КонецПроцедуры

Функция Содержит(Элемент) Экспорт
	Возврат Соответствие.Получить(Элемент) <> Неопределено;
КонецФункции

Функция СодержитВсе(Коллекция) Экспорт

	Результат = Истина;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Не Содержит(Итератор.Следующий()) Тогда
			Результат = Ложь;
			Прервать;
		КонецЕсли;

	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция Пусто() Экспорт
	Возврат Количество() = 0;
КонецФункции

Функция ПроцессорКоллекции() Экспорт
	Возврат ПроцессорыКоллекций.ИзКоллекции(ВМассив());
КонецФункции
 
Функция Количество() Экспорт
	Возврат Соответствие.Количество();
КонецФункции

Функция ВМассив() Экспорт
	
	Результат = Новый Массив;

	Для каждого КлючИЗначение Из Соответствие Цикл
		Результат.Добавить(КлючИЗначение.Ключ);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция Добавить(Элемент) Экспорт

	Если Не Содержит(Элемент) Тогда
		
		Соответствие.Вставить(Элемент, Истина);

		ОповеститьОбИзмененииКоллекции();

		Возврат Истина;

	КонецЕсли;

	Возврат Ложь;

КонецФункции

Функция ДобавитьВсе(Коллекция) Экспорт

	БылДобавленХотяБыОдинЭлемент = Ложь;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		БылДобавленХотяБыОдинЭлемент = Добавить(Итератор.Следующий())
			Или БылДобавленХотяБыОдинЭлемент;

	КонецЦикла;

	Возврат БылДобавленХотяБыОдинЭлемент;

КонецФункции

Процедура Очистить() Экспорт
	Соответствие.Очистить();
КонецПроцедуры

Функция Удалить(Элемент) Экспорт
	
	Если Содержит(Элемент) Тогда
	
		Соответствие.Удалить(Элемент);
		ОповеститьОбИзмененииКоллекции();

		Возврат Истина;
	
	КонецЕсли;

	Возврат Ложь;

КонецФункции

Функция УдалитьВсе(Коллекция) Экспорт

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		БылУдаленХотяБыОдинЭлемент = Удалить(Итератор.Следующий())
			Или БылУдаленХотяБыОдинЭлемент;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Функция УдалитьЕсли(Знач Предикат, Знач Контекст = Неопределено) Экспорт

	Если Пусто() Тогда
		Возврат Ложь;
	КонецЕсли;

	Если ТипЗнч(Предикат) = Тип("Строка") Тогда

		Предикат = Лямбда.Выражение(Предикат)
			.Интерфейс(ФункциональныеИнтерфейсы.УниФункция());

		Если ТипЗнч(Контекст) = Тип("Структура")
            Или ТипЗнч(Контекст) = Тип("ФиксированнаяСтруктура") Тогда
			Предикат.Контекст(Контекст);
		Иначе
			Предикат.ЗахватитьОбъект(Контекст);
		КонецЕсли;

		Предикат = Предикат.ВДействие();

	КонецЕсли;

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Предикат.Выполнить(Итератор.Следующий()) Тогда
			
			Итератор.Удалить();

			БылУдаленХотяБыОдинЭлемент = Истина;

		КонецЕсли;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Функция СохранитьВсе(Коллекция) Экспорт

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Не Коллекция.Содержит(Итератор.Следующий()) Тогда
			
			Итератор.Удалить();

			БылУдаленХотяБыОдинЭлемент = Истина;

		КонецЕсли;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Процедура ОповеститьОбИзмененииКоллекции()
	
	Если ЕстьИтераторы Тогда
		ВызватьСобытие("КоллекцияМодифицирована", Новый Массив);
	КонецЕсли;

КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Представление, СтандартнаяОбработка) // BSLLS:UnusedLocalMethod-off
	КоллекцииСлужебный.ОбработчикПолученияПредставленияКоллекции(ЭтотОбъект, Представление, СтандартнаяОбработка);
КонецПроцедуры

Функция ПолучитьИтератор() // BSLLS:UnusedLocalMethod-off
	Возврат Новый СлужебныйИтераторДляДвижка(Итератор());
КонецФункции

&Обходимое
&Реализует("Множество")
Процедура ПриСозданииОбъекта(Коллекция = Неопределено)
	
	Соответствие  = Новый Соответствие;
	ЕстьИтераторы = Ложь;

	Если Коллекция <> Неопределено Тогда
		ДобавитьВсе(Коллекция);
	КонецЕсли;

КонецПроцедуры
