Функция КакКарта(Соответствие) Экспорт
	
	Результат = Новый КартаСоответствие();

	Для каждого КлючИЗначение Из Соответствие Цикл
		Результат.Вставить(КлючИЗначение.Ключ, КлючИЗначение.Значение);
	КонецЦикла;

	Возврат Результат;

КонецФункции
