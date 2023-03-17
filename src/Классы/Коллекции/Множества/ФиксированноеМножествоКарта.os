Перем ВнутреннееМножество; // Ссылка на внутреннее множество

Функция Итератор() Экспорт

	Рефлектор = Новый Рефлектор();
	
	ВнутренняяКарта = Рефлектор.ПолучитьСвойство(ВнутреннееМножество, "ВнутренняяКарта");

	Возврат Новый ЧитающийИтераторКлючСоответствие(
		Рефлектор.ПолучитьСвойство(ВнутренняяКарта, "Соответствие"),
		ВнутренняяКарта
	);

КонецФункции

Процедура ДляКаждого(Алгоритм) Экспорт
	ВнутреннееМножество.ДляКаждого(Алгоритм);
КонецПроцедуры

Функция Содержит(Элемент) Экспорт
	Возврат ВнутреннееМножество.Содержит(Элемент);
КонецФункции

Функция СодержитВсе(Коллекция) Экспорт
	Возврат ВнутреннееМножество.СодержитВсе(Коллекция);
КонецФункции

Функция Пусто() Экспорт
	Возврат ВнутреннееМножество.Пусто();
КонецФункции

Функция ПроцессорКоллекции() Экспорт
	Возврат ВнутреннееМножество.ПроцессорКоллекции();
КонецФункции

Функция Количество() Экспорт
	Возврат ВнутреннееМножество.Количество();
КонецФункции

Функция ВМассив() Экспорт
	Возврат ВнутреннееМножество.ВМассив();
КонецФункции

&Реализует("ЧитаемоеМножество")
Процедура ПриСозданииОбъекта(Коллекция = Неопределено)
	ВнутреннееМножество = Новый МножествоКарта(Коллекция);
КонецПроцедуры
