Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	// регистр ДанныеПоАптекам
	Движения.ДанныеПоАптекам.Записывать = Истина;
	//Если ПланПоВыручке=ТЧРасчет.Итог("ЛичнаяВыручка")+ТЧРасчет.Итог("ЛичнаяВыручкаПоДМ") тогда
		Для Каждого ТекСтрокаТЧРасчет Из ТЧРасчет Цикл 
			Если ТекСтрокаТЧРасчет.Уволенная=Ложь тогда 
				Движение = Движения.ДанныеПоАптекам.Добавить();
				Движение.Статус = Статус;
				Движение.Подразделение = ТекСтрокаТЧРасчет.ПодразделениеСотрудника;
				Движение.Должность = ТекСтрокаТЧРасчет.Должность;
				Движение.РазрядКатегория = ТекСтрокаТЧРасчет.РазрядКатегория;
				//Движение.РазрядПодразделение = ТекСтрокаТЧРасчет.РазрядПодразделение;
				Движение.ПодразделениеРаботы = Подразделение;
				Движение.Сотрудник = ТекСтрокаТЧРасчет.Сотрудник;
				Движение.ФизическоеЛицо = ТекСтрокаТЧРасчет.ФизическоеЛицо;
				Движение.ДатаПо = ДатаПо;
				Движение.ДатаС = ДатаС;
				Движение.ВремяДень = ТекСтрокаТЧРасчет.ВремяДень;
				Движение.ВремяНочь = ТекСтрокаТЧРасчет.ВремяНочь;
				//Движение.БонусЗаОценку = ТекСтрокаТЧРасчет.БонусЗаОценку;
				//Движение.БонусСроковые = ТекСтрокаТЧРасчет.БонусСроковые;
				//Движение.БонусМУ = ТекСтрокаТЧРасчет.БонусМУ;
				//Движение.БонусПоДМ = ТекСтрокаТЧРасчет.БонусПоДМ;                      
				//Движение.БонусЗаСовмещение = ТекСтрокаТЧРасчет.БонусЗаСовмещение;
				//Движение.ЛичнаяВыручкаДТМ=ТекСтрокаТЧРасчет.ЛичнаяВыручкаПоДМ;
				//Движение.ЛичнаяВыручкаНеДТМ=ТекСтрокаТЧРасчет.ЛичнаяВыручка;
				//Движение.БонусЗаЛичнуюВыручку = ТекСтрокаТЧРасчет.БонусЗаЛичнуюВыручку;
				//Движение.ПланМУСреднечасовой=ТекСтрокаТЧРасчет.ПланМУСреднечасовой;
				//Движение.ФактПродажМУЗаЧас=ТекСтрокаТЧРасчет.ФактПродажМУЗаЧас;
				//Движение.ФактПродажМУЗаМесяц=ТекСтрокаТЧРасчет.ФактПродажМУЗаМесяц;
				Если ТекСтрокаТЧРасчет.ПервоначальныйРасчетПоУволенным=Истина тогда
					Движение.Уволенная=истина;
				КонецЕсли;
				//Движение.ОценкаТекст=ТекСтрокаТЧРасчет.Оценка;
				//
				//Движение.Среднечасовое1 = ТекСтрокаТЧРасчет.Среднечасовое1; 
				//Движение.Среднечасовое2=ТекСтрокаТЧРасчет.Среднечасовое2;
				//Движение.КоличествоУпаковок=ТекСтрокаТЧРасчет.КоличествоУпаковок;
				Если ТекСтрокаТЧРасчет.Должность=Справочники.Должности.НайтиПоНаименованию("Администратор",истина) Тогда
					Движение.ПоказательKPI1=ТекСтрокаТЧРасчет.ВыполнениеПланаKPIВзвешен;
					Движение.ПоказательKPI2=ТекСтрокаТЧРасчет.КачественныйПоказательKPIВзвешен;
				КонецЕсли; 
				Если ТекСтрокаТЧРасчет.Должность=Справочники.Должности.НайтиПоНаименованию("Горничная",истина) Тогда 
					Движение.ПоказательKPI2=ТекСтрокаТЧРасчет.КачествоРаботыГорничнаяВзвешен; //границы учитываются 
				КонецЕсли;
				Движение.ПремияKPI=ТекСтрокаТЧРасчет.ИтогоKPI;
				
			КонецЕсли;
		КонецЦикла;
	//иначе 
	//	Сообщить("Фактическая выручка превышает значение сумм по личной выручке");
	//	Отказ=истина;
	//конецесли;
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры