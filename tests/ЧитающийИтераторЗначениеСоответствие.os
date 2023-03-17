#Использовать asserts
#Использовать decorator
#Использовать ".."

Перем Рефлектор;               // Рефлектор
Перем ДляКаждогоВыполнилсяРаз; // Количество раз которое выполнился метод ДляКаждого

&Тест
Процедура ИтераторСоздается() Экспорт

	// Когда

	Результат = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ЧитающийИтераторЗначениеСоответствие");

КонецПроцедуры

&Тест
Процедура НетСледующего() Экспорт
	
	// Дано
	
	Итератор = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);
	Рефлектор.УстановитьСвойство(Итератор, "ВнутреннийИтератор", ИтераторФикстура());

	Итератор.Следующий();
	Итератор.Следующий();
	Итератор.Следующий();

	// Когда

	Результат = Итератор.ЕстьСледующий();

	// Тогда

	Ожидаем.Что(Результат).ЭтоЛожь();

КонецПроцедуры

&Тест
Процедура ЕстьСледующий() Экспорт
	
	// Дано
	
	Итератор = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);
	Рефлектор.УстановитьСвойство(Итератор, "ВнутреннийИтератор", ИтераторФикстура());

	// Когда

	Результат = Итератор.ЕстьСледующий();

	// Тогда

	Ожидаем.Что(Результат).ЭтоИстина();

КонецПроцедуры

&Тест
Процедура Следующий() Экспорт
	
	// Дано
	
	Итератор = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);
	Рефлектор.УстановитьСвойство(Итератор, "ВнутреннийИтератор", ИтераторФикстура());

	// Когда

	Результат = Итератор.Следующий();

	// Тогда

	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура СледующийВызываетИсключениеПриВыходеЗаГраницы() Экспорт
	
	// Дано
	
	Итератор = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);
	Рефлектор.УстановитьСвойство(Итератор, "ВнутреннийИтератор", ИтераторФикстура());

	Итератор.Следующий();
	Итератор.Следующий();
	Итератор.Следующий();

	// Тогда

	Ожидаем.Что(Итератор)
		.Метод("Следующий")
		.ВыбрасываетИсключение("Значение индекса выходит за пределы диапазона");

КонецПроцедуры

&Тест
Процедура ДляКаждогоОставшегося() Экспорт
	
	// Дано
	
	ДляКаждогоВыполнилсяРаз = 0;

	Итератор = Новый ЧитающийИтераторЗначениеСоответствие(Новый Соответствие, ЭтотОбъект);
	Рефлектор.УстановитьСвойство(Итератор, "ВнутреннийИтератор", ИтераторФикстура());
	Итератор.Следующий();

	// Когда

	Итератор.ДляКаждогоОставшегося(Новый Действие(ЭтотОбъект, "ДействиеДляКаждогоОставшегося"));

	// Тогда

	Ожидаем.Что(ДляКаждогоВыполнилсяРаз).Равно(2);
	Ожидаем.Что(Итератор.ЕстьСледующий()).ЭтоЛожь();

КонецПроцедуры

Процедура ДействиеДляКаждогоОставшегося(Элемент) Экспорт
	
	ДляКаждогоВыполнилсяРаз = ДляКаждогоВыполнилсяРаз + 1;

	Ожидаем.Что(Элемент).Равно(ДляКаждогоВыполнилсяРаз + 1);

КонецПроцедуры

Функция ИтераторФикстура()

	Массив = Новый Массив;
	Массив.Добавить(1);
	Массив.Добавить(2);
	Массив.Добавить(3);

	ПолеМассив = Новый Поле("Массив")
		.ЗначениеПоУмолчанию(Массив);

	ПолеКурсор = Новый Поле("Курсор")
		.ЗначениеПоУмолчанию(0);

	МетодЕстьСледующий = Новый Метод("ЕстьСледующий")
		.Публичный()
		.ТелоМетода("Возврат Курсор <> Массив.Количество();");
	
	МетодСледующий = Новый Метод("Следующий")
		.Публичный()
		.ТелоМетода(
			"Курсор = Курсор + 1;
			|Возврат Массив[Курсор - 1];"
		);

	МетодДляКаждогоОставшегося = Новый Метод("ДляКаждогоОставшегося")
		.Параметр(Новый ПараметрМетода("Действие"))
		.Публичный()
		.ТелоМетода(
			"Пока ЕстьСледующий() Цикл 
			|	Действие.Выполнить(Следующий());
			|КонецЦикла;"
		);

	Возврат Новый ПостроительДекоратора()
		.Поле(ПолеМассив)
		.Поле(ПолеКурсор)
		.Метод(МетодЕстьСледующий)
		.Метод(МетодСледующий)
		.Метод(МетодДляКаждогоОставшегося)
		.Построить();

КонецФункции

Рефлектор = Новый Рефлектор;
