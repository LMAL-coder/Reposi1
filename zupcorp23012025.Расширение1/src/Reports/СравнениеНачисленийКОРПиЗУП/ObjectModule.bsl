Процедура ПриКомпоновкеРезультата(ДокументРезультат, ДанныеРасшифровки, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	
	НастройкиОтчета = КомпоновщикНастроек.ПолучитьНастройки();
	
	ПараметрПериод = НастройкиОтчета.ПараметрыДанных.Элементы.Найти("Период");
	Если ПараметрПериод.Использование Тогда
		Период1 = ПараметрПериод.Значение;
	Иначе
		Период1 = Дата(2024,01,01,00,00,00);
	КонецЕсли;
	ДатаНачала=Период1.ДатаНачала;
	ДатаОкончания=Период1.ДатаОкончания;
	//ДатаОкончания=Дата(2024,09,30,23,59,59);
	
	//Нужно получить начисления из ЗУП
	ПараметрыПодключения = ЗГ_ПроцедурыИФункцииСервер.ПолучитьПараметрыПодключения("ЗУП ПРОФ 3.1");
	Если НЕ ЗначениеЗаполнено(ПараметрыПодключения.Сервер) Тогда
		ВызватьИсключение "Не найдены параметры подключения к базе «ЗУП ПРОФ»";
	КонецЕсли;
	
	Соединение = Новый HTTPСоединение(ПараметрыПодключения.Сервер,, ПараметрыПодключения.Пользователь, ПараметрыПодключения.Пароль);
	ЗапросHTTP = Новый HTTPЗапрос("/"+ПараметрыПодключения.ПубликацияНаВебСервере+"/hs/api/test");
	ОтветHTTP = Соединение.Получить(ЗапросHTTP);
	Если ОтветHTTP.КодСостояния <> 200 Тогда
		ВызватьИсключение "Произошла ошибка при подключении к базе «ЗУП ПРОФ» ";
	КонецЕсли;
	//"СотрудникНаименование, ИНН, ПериодДействия, ДатаНачала, ДатаОкончания, ВидРасчета, Сумма"
	ТаблицаЗУП = Новый ТаблицаЗначений;
	ТаблицаЗУП.Колонки.Добавить("СотрудникНаименование", Новый ОписаниеТипов("Строка", ,,, Новый КвалификаторыСтроки(200)));
	ТаблицаЗУП.Колонки.Добавить("ИНН", Новый ОписаниеТипов("Строка", ,,, Новый КвалификаторыСтроки(20)));
	ТаблицаЗУП.Колонки.Добавить("ПериодДействия", Новый ОписаниеТипов("Дата"));
	ТаблицаЗУП.Колонки.Добавить("ДатаНачала", Новый ОписаниеТипов("Дата"));
	ТаблицаЗУП.Колонки.Добавить("ДатаОкончания", Новый ОписаниеТипов("Дата"));
	ТаблицаЗУП.Колонки.Добавить("ВидРасчета", Новый ОписаниеТипов("Строка", ,,, Новый КвалификаторыСтроки(200)));
	ТаблицаЗУП.Колонки.Добавить("Сумма", Новый ОписаниеТипов("Число"));
	
	Запрос = Новый HTTPЗапрос(СтрШаблон("/"+ПараметрыПодключения.ПубликацияНаВебСервере+"/hs/api/nachislenisotr/%1",Формат(ДатаНачала, "ДФ=yyyyMMdd")));
	Ответ = Соединение.Получить(Запрос);
	Если Ответ.КодСостояния = 200 Тогда
		Чтение = Новый ЧтениеJSON;
		Чтение.УстановитьСтроку(Ответ.ПолучитьТелоКакСтроку());
		ДанныеТабеля = ПрочитатьJSON(Чтение);
		ТаблицаЗУП.Очистить();
		Для Каждого Стр Из ДанныеТабеля Цикл
			Нов = ТаблицаЗУП.Добавить();
			Нов.СотрудникНаименование=Стр.СотрудникНаименование;
			Нов.ИНН=Стр.ИНН;
			Нов.ПериодДействия=Дата(Стр.ПериодДействия);
			Нов.ДатаНачала=Дата(Стр.ДатаНачала);
			Нов.ДатаОкончания=Дата(Стр.ДатаОкончания);
			Нов.ВидРасчета=Стр.ВидРасчета;
			Нов.Сумма=Стр.Сумма;
		КонецЦикла
	КонецЕсли;
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос1 = Новый Запрос;
	Запрос1.УстановитьПараметр("ДанныеЗУП", ТаблицаЗУП);
	Запрос1.Текст = 
	"ВЫБРАТЬ
	|	ДанныеЗУП.СотрудникНаименование КАК СотрудникНаименование,
	|	ДанныеЗУП.ИНН КАК ИНН,
	|	ДанныеЗУП.ПериодДействия КАК ПериодДействия,
	|	ДанныеЗУП.ДатаНачала КАК ДатаНачала,
	|	ДанныеЗУП.ДатаОкончания КАК ДатаОкончания,
	|	ДанныеЗУП.ВидРасчета КАК ВидРасчета,
	|	ДанныеЗУП.Сумма КАК Сумма
	|ПОМЕСТИТЬ ВТ_ДанныеЗУП
	|ИЗ
	|	&ДанныеЗУП КАК ДанныеЗУП
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	ВТ_ДанныеЗУП.СотрудникНаименование КАК СотрудникНаименование,
	|	ВТ_ДанныеЗУП.ИНН КАК ИНН,
	|	ВТ_ДанныеЗУП.ПериодДействия КАК ПериодДействия,
	|	ВТ_ДанныеЗУП.ДатаНачала КАК ДатаНачала,
	|	ВТ_ДанныеЗУП.ДатаОкончания КАК ДатаОкончания,
	|	ВТ_ДанныеЗУП.ВидРасчета КАК ВидРасчета,
	|	ВТ_ДанныеЗУП.Сумма КАК Сумма
	|ПОМЕСТИТЬ ВТ_Сотрудник
	|ИЗ
	|	ВТ_ДанныеЗУП КАК ВТ_ДанныеЗУП
	|ГДЕ
	|	ВТ_ДанныеЗУП.ИНН = &ИНН
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	ВТ_Сотрудник.ИНН КАК ИНН,
	|	СУММА(ВТ_Сотрудник.Сумма) КАК Сумма
	|ПОМЕСТИТЬ ВТ_СотрудникИтого
	|ИЗ
	|	ВТ_Сотрудник КАК ВТ_Сотрудник
	|
	|СГРУППИРОВАТЬ ПО
	|	ВТ_Сотрудник.ИНН
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	ВТ_Сотрудник.СотрудникНаименование КАК СотрудникНаименование,
	|	ВТ_Сотрудник.ИНН КАК ИНН,
	|	ВТ_Сотрудник.ПериодДействия КАК ПериодДействия,
	|	ВТ_Сотрудник.ДатаНачала КАК ДатаНачала,
	|	ВТ_Сотрудник.ДатаОкончания КАК ДатаОкончания,
	|	ВТ_Сотрудник.ВидРасчета КАК ВидРасчета,
	|	ВТ_Сотрудник.Сумма КАК Сумма,
	|	ВТ_СотрудникИтого.Сумма КАК СуммаИтого
	|ИЗ
	|	ВТ_Сотрудник КАК ВТ_Сотрудник
	|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ ВТ_СотрудникИтого КАК ВТ_СотрудникИтого
	|		ПО ВТ_Сотрудник.ИНН = ВТ_СотрудникИтого.ИНН
	|
	|УПОРЯДОЧИТЬ ПО
	|	ВидРасчета";
	
	
	
	ТаблицаИтог=Новый ТаблицаЗначений;
	ТаблицаИтог.Колонки.Добавить("ФизическоеЛицо", Новый ОписаниеТипов("СправочникСсылка.ФизическиеЛица"));
	ТаблицаИтог.Колонки.Добавить("Подразделение", Новый ОписаниеТипов("СправочникСсылка.ПодразделенияОрганизаций"));
	ТаблицаИтог.Колонки.Добавить("Должность", Новый ОписаниеТипов("СправочникСсылка.Должности"));
	ТаблицаИтог.Колонки.Добавить("Номер", Новый ОписаниеТипов("Число"));
	//ТаблицаИтог.Колонки.Добавить("ВидРасчетаУУ", Новый ОписаниеТипов("Строка", ,,, Новый КвалификаторыСтроки(200)));
	ТаблицаИтог.Колонки.Добавить("СуммаИтогоУУ", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ОплатаПоЧасам", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ОплатаПоЧасам1", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ОплатаПоЧасам2", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ВсегоПремииРаспределено", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ВсегоПремииРаспределено1", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ВсегоПремииРаспределено2", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("Удержания", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("Удержания1", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("Удержания2", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("ВидРасчетаЮУ", Новый ОписаниеТипов("Строка", ,,, Новый КвалификаторыСтроки(200)));
	ТаблицаИтог.Колонки.Добавить("СуммаЮУ", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("СуммаИтогоЮУ", Новый ОписаниеТипов("Число"));
	ТаблицаИтог.Колонки.Добавить("Дельта", Новый ОписаниеТипов("Число"));
	
	//Получаем данные табеля из Корп 
	Запрос2 = Новый Запрос;
	Запрос2.Текст = 
	"ВЫБРАТЬ
	|	НачисленияЗППоАптекамЗУП.ФизическоеЛицо КАК ФизическоеЛицо,
	|	НачисленияЗППоАптекамЗУП.ИНН КАК ИНН,
	|	НачисленияЗППоАптекамЗУП.Должность КАК Должность,
	|	НачисленияЗППоАптекамЗУП.ОсновнаяАптека КАК Подразделение,
	|	НачисленияЗППоАптекамЗУП.ВсегоПоРасчету КАК ВсегоПоРасчету,
	|	НачисленияЗППоАптекамЗУП.ОплатаПоЧасам КАК ОплатаПоЧасам,
	|	НачисленияЗППоАптекамЗУП.ОплатаПоЧасам1 КАК ОплатаПоЧасам1,
	|	НачисленияЗППоАптекамЗУП.ОплатаПоЧасам2 КАК ОплатаПоЧасам2,
	|	НачисленияЗППоАптекамЗУП.ВсегоПремииРаспределено КАК ВсегоПремииРаспределено,
	|	НачисленияЗППоАптекамЗУП.ВсегоПремииРаспределено1 КАК ВсегоПремииРаспределено1,
	|	НачисленияЗППоАптекамЗУП.ВсегоПремииРаспределено2 КАК ВсегоПремииРаспределено2,
	|	НачисленияЗППоАптекамЗУП.Удержания КАК Удержания,
	|	НачисленияЗППоАптекамЗУП.Удержания1 КАК Удержания1,
	|	НачисленияЗППоАптекамЗУП.Удержания2 КАК Удержания2
	|ИЗ
	|	РегистрСведений.НачисленияЗППоАптекамЗУП КАК НачисленияЗППоАптекамЗУП
	|ГДЕ
	|	НачисленияЗППоАптекамЗУП.Период МЕЖДУ &ДатаНачала И &ДатаОкончания
	|
	|УПОРЯДОЧИТЬ ПО
	|	НачисленияЗППоАптекамЗУП.ФизическоеЛицо.Наименование";
	
	Запрос2.УстановитьПараметр("ДатаНачала", ДатаНачала);
	Запрос2.УстановитьПараметр("ДатаОкончания", ДатаОкончания);
	
	РезультатЗапроса = Запрос2.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	//Обходим по физ лицам КОРП
	//СуммаУУИтого=0;
	//СуммаЮУИтого=0;	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		СтрТабИтог=ТаблицаИтог.Добавить();
		СтрТабИтог.ФизическоеЛицо=ВыборкаДетальныеЗаписи.ФизическоеЛицо; 
		СтрТабИтог.Подразделение=ВыборкаДетальныеЗаписи.Подразделение;
		СтрТабИтог.Должность=ВыборкаДетальныеЗаписи.Должность;
		СтрТабИтог.Номер=1;
		
		//Получаем данные из ЗУП
		Запрос1.УстановитьПараметр("ИНН", ВыборкаДетальныеЗаписи.ИНН);
		РезультатЗапросаЗУП = Запрос1.Выполнить().Выгрузить();

		//1 строка
		//СтрТабИтог.ВидРасчетаУУ="Всего по расчету";
		СтрТабИтог.СуммаИтогоУУ=ВыборкаДетальныеЗаписи.ВсегоПоРасчету+ВыборкаДетальныеЗаписи.Удержания;
		СтрТабИтог.ОплатаПоЧасам=ВыборкаДетальныеЗаписи.ОплатаПоЧасам;
		СтрТабИтог.ОплатаПоЧасам1=ВыборкаДетальныеЗаписи.ОплатаПоЧасам1;
		СтрТабИтог.ОплатаПоЧасам2=ВыборкаДетальныеЗаписи.ОплатаПоЧасам2;
		СтрТабИтог.ВсегоПремииРаспределено=ВыборкаДетальныеЗаписи.ВсегоПремииРаспределено;
		СтрТабИтог.ВсегоПремииРаспределено1=ВыборкаДетальныеЗаписи.ВсегоПремииРаспределено1;
		СтрТабИтог.ВсегоПремииРаспределено2=ВыборкаДетальныеЗаписи.ВсегоПремииРаспределено2;
		СтрТабИтог.Удержания=ВыборкаДетальныеЗаписи.Удержания;
		СтрТабИтог.Удержания1=ВыборкаДетальныеЗаписи.Удержания1;
		СтрТабИтог.Удержания2=ВыборкаДетальныеЗаписи.Удержания2;
		СтрТабИтог.ВидРасчетаЮУ="Всего начислено ЮУ";
		СтрТабИтог.Дельта=-1;
		Если РезультатЗапросаЗУП.Количество()>0 Тогда
			
			k=1;
			Для каждого СтрокаЗУП Из РезультатЗапросаЗУП Цикл
				Если k=1 Тогда
					СтрТабИтог.СуммаИтогоЮУ=СтрокаЗУП.СуммаИтого;
					СтрТабИтог.Дельта=СтрТабИтог.СуммаИтогоУУ-СтрТабИтог.СуммаИтогоЮУ;
				КонецЕсли;
				//для второй и последующих строк
					СтрТабИтог=ТаблицаИтог.Добавить();
					СтрТабИтог.ФизическоеЛицо=ВыборкаДетальныеЗаписи.ФизическоеЛицо; 
					СтрТабИтог.Подразделение=ВыборкаДетальныеЗаписи.Подразделение;
					СтрТабИтог.Должность=ВыборкаДетальныеЗаписи.Должность;
					СтрТабИтог.Номер=k+1;
					СтрТабИтог.ВидРасчетаЮУ=СтрокаЗУП.ВидРасчета;
					СтрТабИтог.СуммаЮУ=СтрокаЗУП.Сумма;
				k=k+1;
			КонецЦикла;
		КонецЕсли	
		
	КонецЦикла; 
	
	
	СтандартнаяОбработка = Ложь;
	//НастройкиОтчета = КомпоновщикНастроек.ПолучитьНастройки();	
	ДокументРезультат.Очистить();
	
	КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
	МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, НастройкиОтчета, ДанныеРасшифровки);
	
	ВнешнийИД =  Новый Структура("ТаблицаИтог", ТаблицаИтог);
	
	// Создадим и инициализируем процессор компоновки.
	ПроцессорКомпоновки = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновки.Инициализировать(МакетКомпоновки, ВнешнийИД , ДанныеРасшифровки, Истина);
	
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВТабличныйДокумент;
	ПроцессорВывода.УстановитьДокумент(ДокументРезультат);
	
	// Обозначим начало вывода.
	ПроцессорВывода.Вывести(ПроцессорКомпоновки, Истина);
	
КонецПроцедуры