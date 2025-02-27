
Процедура ОбработкаПроведения(Отказ, Режим)
	// регистр НачисленияЗППоАптекамЗУП
	Движения.НачисленияЗППоАптекамЗУП.Записывать = Истина;
	Для Каждого ТекСтрокаТЧАптека Из ТЧАптека Цикл
		Движение = Движения.НачисленияЗППоАптекамЗУП.Добавить();
		Движение.Период = ДатаС;
		Движение.ФизическоеЛицо=ТекСтрокаТЧАптека.Сотрудник;
		Движение.Должность = ТекСтрокаТЧАптека.Должность;
		Движение.ТН = ТекСтрокаТЧАптека.ТН;
		Движение.ДокументОснование =ДокументОснование;
		
		Движение.МинимумПоСотруднику = ТекСтрокаТЧАптека.МинимумПоСотруднику;
		Движение.МинимумПоФакту = ТекСтрокаТЧАптека.МинимумПоФакту;
		Движение.МаксимумПоСотруднику = ТекСтрокаТЧАптека.МаксимумПоСотруднику;
		Движение.МаксимумПоФакту = ТекСтрокаТЧАптека.МаксимумПоФакту;
		Движение.ИтогоДоГраниц = ТекСтрокаТЧАптека.ИтогоДоГраниц;
		Движение.ВсегоПоРасчету = ТекСтрокаТЧАптека.ВсегоПоРасчету;
		Движение.ОтработаноВсего = ТекСтрокаТЧАптека.ОтработаноВсего;
		Движение.ИтогоЗаОтработанноеВремя = ТекСтрокаТЧАптека.ИтогоЗаОтработанноеВремя;
		Движение.РаспределеноЧасов = ТекСтрокаТЧАптека.РаспределеноЧасов;
		Движение.РаспределеноЧасов1 = ТекСтрокаТЧАптека.РаспределеноЧасов1;
		Движение.РаспределеноЧасов2 = ТекСтрокаТЧАптека.РаспределеноЧасов2;
		Движение.ОплатаПоЧасам = ТекСтрокаТЧАптека.ОплатаПоЧасам;
		Движение.ОплатаПоЧасам1 = ТекСтрокаТЧАптека.ОплатаПоЧасам1;
		Движение.ОплатаПоЧасам2 = ТекСтрокаТЧАптека.ОплатаПоЧасам2;
		Движение.ВсегоПремииРаспределено = ТекСтрокаТЧАптека.ВсегоПремииРаспределено;
		Движение.ВсегоПремииРаспределено1 = ТекСтрокаТЧАптека.ВсегоПремииРаспределено1;
		Движение.ВсегоПремииРаспределено2 = ТекСтрокаТЧАптека.ВсегоПремииРаспределено2;
		Движение.ДоплатаЗаНапряженность = ТекСтрокаТЧАптека.ДоплатаЗаНапряженность;
		Движение.ДоплатаЗаНапряженность1 = ТекСтрокаТЧАптека.ДоплатаЗаНапряженность1;
		Движение.ДоплатаЗаНапряженность2 = ТекСтрокаТЧАптека.ДоплатаЗаНапряженность2;
		Движение.БонусНеДТМ = ТекСтрокаТЧАптека.БонусНеДТМ;
		Движение.БонусДТМ = ТекСтрокаТЧАптека.БонусДТМ;
		Движение.ПремияЗаЛичнуюВыручку = ТекСтрокаТЧАптека.ПремияЗаЛичнуюВыручку;
		Движение.ПремияЗаЛичнуюВыручку1 = ТекСтрокаТЧАптека.ПремияЗаЛичнуюВыручку1;
		Движение.ПремияЗаЛичнуюВыручку2 = ТекСтрокаТЧАптека.ПремияЗаЛичнуюВыручку2;
		Движение.БонусАкции = ТекСтрокаТЧАптека.БонусАкции;
		Движение.ПремияЗаМаркетинговыеАкции = ТекСтрокаТЧАптека.ПремияЗаМаркетинговыеАкции;
		Движение.ПремияЗаМаркетинговыеАкции1 = ТекСтрокаТЧАптека.ПремияЗаМаркетинговыеАкции1;
		Движение.ПремияЗаМаркетинговыеАкции2 = ТекСтрокаТЧАптека.ПремияЗаМаркетинговыеАкции2;
		Движение.БонусЗМЗ = ТекСтрокаТЧАптека.БонусЗМЗ;
		Движение.ПремияСрокиИЗМЗ = ТекСтрокаТЧАптека.ПремияСрокиИЗМЗ;
		Движение.ПремияСрокиИЗМЗ1 = ТекСтрокаТЧАптека.ПремияСрокиИЗМЗ1;
		Движение.ПремияСрокиИЗМЗ2 = ТекСтрокаТЧАптека.ПремияСрокиИЗМЗ2;
		Движение.Доплата1 = ТекСтрокаТЧАптека.Доплата1;
		Движение.ПремияЗаКомандировки = ТекСтрокаТЧАптека.ПремияЗаКомандировки;
		Движение.ПремияЗаКомандировки1 = ТекСтрокаТЧАптека.ПремияЗаКомандировки1;
		Движение.ПремияЗаКомандировки2 = ТекСтрокаТЧАптека.ПремияЗаКомандировки2;
		Движение.Доплата2 = ТекСтрокаТЧАптека.Доплата2;
		Движение.Удержания = ТекСтрокаТЧАптека.Удержания;
		Движение.Удержания1 = ТекСтрокаТЧАптека.Удержания1;
		Движение.Удержания2 = ТекСтрокаТЧАптека.Удержания2;
		
		Движение.ОсновнаяАптека=ТекСтрокаТЧАптека.ОсновнаяАптека;
		Движение.РазрядКатегория = ТекСтрокаТЧАптека.РазрядКатегория;
		Движение.РазрядПодразделение = ТекСтрокаТЧАптека.РазрядПодразделение;
		Движение.ТН_ЗУП1 = ТекСтрокаТЧАптека.ТН_ЗУП1;
		Движение.ТН_ЗУП2 = ТекСтрокаТЧАптека.ТН_ЗУП2;
		Движение.ИНН = ТекСтрокаТЧАптека.ИНН;
		Движение.Уволен = ТекСтрокаТЧАптека.Уволен;
		Движение.ПремияМин = ТекСтрокаТЧАптека.ПремияМин;
		Движение.ПремияМакс = ТекСтрокаТЧАптека.ПремияМакс;
		Движение.ОкладПоЧасам = ТекСтрокаТЧАптека.ОкладПоЧасам;
		Движение.ОбщаяПремия = ТекСтрокаТЧАптека.ОбщаяПремия;
		Движение.Статус1 = ТекСтрокаТЧАптека.Статус1;
		Движение.Статус2 = ТекСтрокаТЧАптека.Статус2;
		Движение.Оклад0_166_Часы = ТекСтрокаТЧАптека.Оклад0_166_Часы;
		Движение.Оклад0_166Сумма = ТекСтрокаТЧАптека.Оклад0_166Сумма;
		Движение.Ночь_Часы = ТекСтрокаТЧАптека.Ночь_Часы;
		Движение.Ночь_Сумма = ТекСтрокаТЧАптека.Ночь_Сумма;
		Движение.ПраздникиДеньЧасы = ТекСтрокаТЧАптека.ПраздникиДеньЧасы;
		Движение.ПраздникиДеньСумма = ТекСтрокаТЧАптека.ПраздникиДеньСумма;
		Движение.ПраздникиНочьЧасы = ТекСтрокаТЧАптека.ПраздникиНочьЧасы;
		Движение.ПраздникиНочьСумма = ТекСтрокаТЧАптека.ПраздникиНочьСумма;
		Движение.РаспределенВЗуп = ТекСтрокаТЧАптека.РаспределенВЗуп;
		Движение.ВидЗанятости1 = ТекСтрокаТЧАптека.ВидЗанятости1;
		Движение.ВидЗанятости2 = ТекСтрокаТЧАптека.ВидЗанятости2;
		Движение.Отпускные = ТекСтрокаТЧАптека.Отпускные;
		Движение.Больничные = ТекСтрокаТЧАптека.Больничные;
		Движение.НеЗагружатьИзЗУП = ТекСтрокаТЧАптека.НеЗагружатьИзЗУП;
	КонецЦикла;
	
КонецПроцедуры
