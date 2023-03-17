// BSLLS:FunctionShouldHaveReturn-off

// Проверяет что есть следующий элемент коллекции
//
//  Возвращаемое значение:
//   Булево - Истина, если есть следующий элемент коллекции
//
Функция ЕстьСледующий() Экспорт
КонецФункции

// Возвращает следующий элемент коллекции
//
//  Возвращаемое значение:
//   Произвольный - следующий элемент коллекции
//
Функция Следующий() Экспорт
КонецФункции

// Выполняет переданный алгоритм для каждого элемента коллекции
//  начиная с того на который указывает итератор
//
// Параметры:
//   Действие - Действие - Делегат на процедуру с одном параметром
//    которая принимает элемент коллекции
//
Процедура ДляКаждогоОставшегося(Действие) Экспорт
КонецПроцедуры

&Интерфейс
Процедура ПриСозданииОбъекта()
	ВызватьИсключение "Нельзя создать экземпляр интерфейса";
КонецПроцедуры
