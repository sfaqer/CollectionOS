Функция ИзЭлементов(	
	// BSLLS:NumberOfParams-off
	// BSLLS:NumberOfOptionalParams-off
	// BSLLS:UnusedParameters-off
		Ключ1 = NULL, Значение1 = NULL, Ключ2 = NULL, Значение2 = NULL,
		Ключ3 = NULL, Значение3 = NULL, Ключ4 = NULL, Значение4 = NULL,
		Ключ5 = NULL, Значение5 = NULL, Ключ6 = NULL, Значение6 = NULL,
		Ключ7 = NULL, Значение7 = NULL, Ключ8 = NULL, Значение8 = NULL,
		Ключ9 = NULL, Значение9 = NULL, Ключ10 = NULL, Значение10 = NULL
	// BSLLS:NumberOfParams-on
	// BSLLS:NumberOfOptionalParams-on
	// BSLLS:UnusedParameters-on
	) Экспорт

	Результат = Новый КартаСоответствие;

	Для сч = 1 По 10 Цикл
		ДобавитьНеПустоеЗначениеВКоллекцию(Результат, Вычислить("Ключ" + сч), Вычислить("Значение" + сч));
	КонецЦикла;

	Возврат Новый ФиксированнаяКарта(Результат);

КонецФункции

Функция Скопировать(Карта) Экспорт
	
	ФиксированныеКарты = Новый Массив;
	ФиксированныеКарты.Добавить(Тип("ФиксированнаяКарта"));

	Если ФиксированныеКарты.Найти(ТипЗнч(Карта)) <> Неопределено Тогда
		Возврат Карта;
	КонецЕсли;

	Результат = Новый(ТипЗнч(Карта));

	Результат.ВставитьВсе(Карта);

	Возврат Новый ФиксированнаяКарта(Результат);

КонецФункции

Процедура ДобавитьНеПустоеЗначениеВКоллекцию(Коллекция, Ключ, Значение)
	Если Ключ <> NULL И Значение <> NULL Тогда
		Коллекция.Вставить(Ключ, Значение);
	КонецЕсли;
КонецПроцедуры
