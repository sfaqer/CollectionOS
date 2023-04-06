Функция ИзЭлементов(	
	// BSLLS:NumberOfParams-off
	// BSLLS:NumberOfOptionalParams-off
	// BSLLS:UnusedParameters-off
		Элемент1 = NULL, Элемент2 = NULL, Элемент3 = NULL, Элемент4 = NULL, Элемент5 = NULL,
		Элемент6 = NULL, Элемент7 = NULL, Элемент8 = NULL, Элемент9 = NULL, Элемент10 = NULL,
		Элемент11 = NULL, Элемент12 = NULL, Элемент13 = NULL, Элемент14 = NULL, Элемент15 = NULL,
		Элемент16 = NULL, Элемент17 = NULL, Элемент18 = NULL, Элемент19 = NULL, Элемент20 = NULL,
		Элемент21 = NULL, Элемент22 = NULL, Элемент23 = NULL, Элемент24 = NULL, Элемент25 = NULL,
		Элемент26 = NULL, Элемент27 = NULL, Элемент28 = NULL, Элемент29 = NULL, Элемент30 = NULL,
		Элемент31 = NULL, Элемент32 = NULL
	// BSLLS:NumberOfParams-on
	// BSLLS:NumberOfOptionalParams-on
	// BSLLS:UnusedParameters-on
	) Экспорт

	Результат = Новый МножествоСоответствие;

	Для сч = 1 По 32 Цикл
		ДобавитьНеПустоеЗначениеВКоллекцию(Результат, Вычислить("Элемент" + сч));
	КонецЦикла;

	Возврат Новый ФиксированноеМножество(Результат);

КонецФункции

Функция Скопировать(Коллекция) Экспорт
	
	ФиксированныеМножества = Новый Массив;
	ФиксированныеМножества.Добавить(Тип("ФиксированноеМножество"));

	Если ФиксированныеМножества.Найти(ТипЗнч(Коллекция)) <> Неопределено Тогда
		Возврат Коллекция;
	КонецЕсли;

	Результат = Новый МножествоСоответствие;

	Результат.ДобавитьВсе(Коллекция);

	Возврат Новый ФиксированноеМножество(Результат);

КонецФункции

Процедура ДобавитьНеПустоеЗначениеВКоллекцию(Коллекция, Значение)
	Если Значение <> NULL Тогда
		Коллекция.Добавить(Значение);
	КонецЕсли;
КонецПроцедуры
