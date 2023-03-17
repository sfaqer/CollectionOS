Перем ВнутреннийИтератор; // Ссылка на итератор соответствия 

Функция ЕстьСледующий() Экспорт
	Возврат ВнутреннийИтератор.ЕстьСледующий();
КонецФункции

Функция Следующий() Экспорт
	Возврат ВнутреннийИтератор.Следующий();
КонецФункции

Процедура ДляКаждогоОставшегося(Действие) Экспорт
	ВнутреннийИтератор.ДляКаждогоОставшегося(Действие);
КонецПроцедуры

&Реализует("ЧитающийИтератор")
Процедура ПриСозданииОбъекта(Соответствие, Источник)
	ВнутреннийИтератор = Новый ИтераторСоответствие(Соответствие, Источник);
КонецПроцедуры
