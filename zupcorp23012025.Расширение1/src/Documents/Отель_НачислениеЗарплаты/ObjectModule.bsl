
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр НачисленияЗППоАптекам
	Движения.НачисленияЗППоАптекам.Записывать = Истина;
	Для Каждого ТекСтрокаТЧАптека Из ТЧАптека Цикл
		Движение = Движения.НачисленияЗППоАптекам.Добавить();
		Движение.Период = ДатаС;
		Движение.Подразделение = Подразделение;
		Движение.ФизическоеЛицо = ТекСтрокаТЧАптека.Сотрудник;
		Движение.Должность = ТекСтрокаТЧАптека.Должность;
		Движение.ОсновнаяАптека = ТекСтрокаТЧАптека.ОсновнаяАптека;
		Движение.ТН = ТекСтрокаТЧАптека.ТН;
		Движение.ИНН = ТекСтрокаТЧАптека.ИНН;
		Движение.ВсегоПоРасчету = ТекСтрокаТЧАптека.ВсегоПоРасчету;
		Движение.МинимумПоФакту = ТекСтрокаТЧАптека.МинимумПоФакту;
		Движение.МаксимумПоФакту = ТекСтрокаТЧАптека.МаксимумПоФакту;
		Движение.ИтогоДоГраниц = ТекСтрокаТЧАптека.ИтогоДоГраниц;
		Движение.ОтработаноВсего = ТекСтрокаТЧАптека.ОтработаноВсего;
		Движение.ИтогоЗаОтработанноеВремя = ТекСтрокаТЧАптека.ИтогоЗаОтработанноеВремя;
		//Движение.Минимум = Минимум;
		//Движение.Оклад0_166_Часы = ТекСтрокаТЧАптека.ДеньЧасы;
		//Движение.Оклад0_166Сумма = ТекСтрокаТЧАптека.ДеньСумма;
		//Движение.Оклад2Часы = ТекСтрокаТЧАптека.Оклад2Часы;
		//Движение.Оклад2Сумма = ТекСтрокаТЧАптека.Оклад2Сумма;
		//Движение.Оклад3_Часы = ТекСтрокаТЧАптека.Оклад3_Часы;
		//Движение.Оклад3_Сумма = ТекСтрокаТЧАптека.Оклад3_Сумма;
		Движение.Ночь_Часы = ТекСтрокаТЧАптека.Ночь_Часы;
		Движение.Ночь_Сумма = ТекСтрокаТЧАптека.Ночь_Сумма;
		Движение.ПремияKPI = ТекСтрокаТЧАптека.ПремияKPI;
		Движение.ИтогоБонусов = ТекСтрокаТЧАптека.ИтогоБонусов;
		//Движение.БонусНеДТМ = ТекСтрокаТЧАптека.БонусНеДТМ;
		//Движение.БонусДТМ = ТекСтрокаТЧАптека.БонусДТМ;
		//Движение.БонусАкции = ТекСтрокаТЧАптека.БонусАкции;
		//Движение.БонусЗМЗ = ТекСтрокаТЧАптека.БонусЗМЗ;
		//Движение.БонусОценка = ТекСтрокаТЧАптека.ПремияKPI;
		//Движение.Доплата1 = ТекСтрокаТЧАптека.Доплата1;
		
		//Движение.ПремияМин = ТекСтрокаТЧАптека.ПремияМин;
		//Движение.ПремияМакс = ТекСтрокаТЧАптека.ПремияМакс;
		Движение.ОкладПоЧасам = ТекСтрокаТЧАптека.ОкладПоЧасам;
		Движение.ОбщаяПремия = ТекСтрокаТЧАптека.ОбщаяПремия; 
		//Движение.ДоплатаЗаКатегорию = ТекСтрокаТЧАптека.ДоплатаЗаКатегорию;
		Движение.Статус1 = ТекСтрокаТЧАптека.Статус1;
		Движение.Статус2 = ТекСтрокаТЧАптека.Статус2;
    КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
