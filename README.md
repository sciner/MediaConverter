# AudioConverter
Программа для конвертирование аудио файлов

  ---------------------------------------------------------
 /\              SCINSoft: MediaConverter                 /\
 \/-------------------------------------------------------\/
 /\       БЕТА_ВЕРСИЯ - ВОЗМОЖНЫ ПРОБЛЕМЫ В РАБОТЕ        /\
 \/              ВО ИЗБЕЖАНИИ НЕДОРАЗУМЕНИЙ               \/
 /\       ОБРАБАТЫВАЙТЕ ТОЛЬКО! КОПИИ ВАШИХ ФАЙЛОВ        /\
 \/-------------------------------------------------------\/
 /\------ Используйте программу на свой страх и риск. ----/\
 \/--- Программа находится на стадии бета-тестирования. --\/
  ---------------------------------------------------------

Все замечания, пожелания и багрепорты пожалуйста оставляйте
на форуме или пишите на lenar2003@mail.ru

Created by SCINER: lenar2003@mail.ru
1:58 13.09.2008
19/05/2004 22:23 - 13.06.2006 13:57 
                   04.03.2006 23:26

Программа предназначена для уменьшения размера песен при переносе на мобильные устройства (мобильник, mp3-плеер).

Программа использует lame.exe для конвертирования из wav в mp3
и bass.dll Для конвертирования mp3 в wav.

В настройках программы можно указать опцию "Перехват буфера обмена", тогда например путь к mp3-шке скопированный в буфер обмена будет сразуже автоматически добавлен в список конвертируемых.
Обычно я этим пользуюсь при копирования пути к песне из винампа. (в следующей версии добавлю горячие клавиши для этой фичи)
При конвертировании mp3->wav-mp3 треков полностью сохраняются ID3v1 теги.
Есть возможность выбора битрейта итоговой mp3-шки, либо фиксированного (32,40,48,56,64,80,96,112,128,160,192,224,256,320), либо переменного (9 уровней различных по качеству).
Можно выбрать папку, в которую будут помещаться перекодированные треки (например сразу на флешку), либо в папку с исходным файлом.

- Преимущества ------------------------------------------------------------------------------
+ Работа на Win98 и более новых.
+ Маленький размер программы
+ Возможность конвертирования практически любого трекерного формата в mp3 wav или ogg
+ Чтение названий треков из трекерной музыки
+ Сохранение оригинальных ID3v1 и ID3v2 тегов при конвертировании mp3->mp3, либо создания тегов в результирующих mp3 если их нет
+ Сохранение списка файлов при любом его изменении в бекап-файл, благодаря чему вы никогда не потеряете с трудом собранный список
+ Возможность автоматического создания списка файлов из указанной папки (с выбором типов файлов), влючая все вложенные папки (опционально)

---------------------------------------------------------------------------------------------
Обо всех багах и недочетах просьба сообщать сюда.
Заранее спасибо...

- история создания -------------------------------------------------------------------------

 1:59 13.09.2008
 + Оптимизировал внутренности программы
 + Добавил возможность конвертирования в ACCPlus формат
 + Вынес настройки качества в главное окно в виде вкладок
 + Убрал лишние пункты меню, для конвертирования в различные форматы, теперь определяется по текущей открытой вкладке

 12:18 19.06.2006
 + добавил возможность конвертирования в ogg-формат

 10:20 14.06.2006
 + пофиксил пункт меню "Убрать из списка"
 + сделал возможным удалять выделенные элементы из списка нажатием кнопки [DEL]

 13:58 13.06.2006
 + опция замены исходного файла новым при конвертировании mp3 -> wav -> mp3
 + добавлен общий визуальный прогрессбар при конвертировании из mp3 -> wav

 17:12 16.06.2006
 + усовершенствован алгоритм действий программы
 + усовершенствована логика выбора папки для конвертируемых файлов
 + теперь выделенные элементы не пропадают из поля зрения при потере окном фокуса
 + после удаления элемента из списка фокус автоматически ставится на следующий элемент
 + клавиша "удалить из списка" теперь не будет доступна если список пуст

- mp3 ---------------------------------------------------------------------------------------
 Поддержка следующих битрейтов:
 32,40,48,56,64,80,96,112,128,160,192,224,256,320

 Кодирование с переменным битрейтом (10 уровней качества):
 0 Отличное
 1 Хорошее
 2 Приемлемое
 3 Выше среднего
 4 Среднее
 5 Нормальное
 6 Удовлетворительное
 7 Ниже среднего
 8 Плохое
 9 Ужасное

- Ogg Vorbis -------------------------------------------------------------------------------
Сколько у вас на винчестере MP3 файлов? 100, 500, 1000? Не удивительно, если даже все 15000!
Все мы любим музыку и, наверное, каждый из нас знаком с MP3. Старый добрый формат,
проверенный временем... Но на MP3 свет клином не сошелся, ведь так? Он был разработан одним
из первых в своем роде, что и дало ему такой толчок в популярности. Могли ли разработчики
учесть все нюансы кодирования музыки с потерями? Могли ли предусмотреть все варианты
применения данного формата, чтобы сделать его наиболее универсальным? Конечно же, нет! 
На протяжении всего существования формата было много претендентов на его замену.
Но преимущества фактически всегда не были достаточно ощутимыми для того, чтобы переходить на
новые форматы. Но тут появился Ogg Vorbis... 
Ogg Vorbis - Новое дыхание сжатого цифрового звука
Ogg Vorbis - это относительно новый универсальный формат аудио компрессии, официально вышедший
летом 2002 года. Он принадлежит к тому же типу форматов, что и МР3, AAC, VQF и WMA, то есть к
форматам компрессии с потерями. Психоаккустическая модель, используемая в Ogg Vorbis, по
принципам действия близка к МР3 и иже с ними, но и только - математическая обработка и
практическая реализация этой модели в корне отличаются, что позволяет авторам объявить свой
формат совершенно независимым от всех предшественников. 
Главное неоспоримое преимущество формата Ogg Vorbis - это его полная открытость и свободность.
Более того, в нем использована новейшая и наиболее качественная психоаккустическая модель,
из-за чего соотношение битрейт/качество значительно ниже, чем у других форматов. Как 
результат - качество звука лучше, но размер файла меньше. 
В формате имеется большое количество достоинств. Например, формат Ogg Vorbis не ограничивает
пользователя только двумя аудио каналами (стерео - левый и правый). Он поддерживает до 255
отдельных каналов с частотой дискретизации до 192kHz и разрядностью до 32bit (чего не
позволяет ни один формат сжатия с потерями), поэтому Ogg Vorbis великолепно подходит для
кодирования 6-ти канального звука DVD-Audio. К тому же, формат OGG Vorbis - sample accurate
Это гарантирует, что звуковые данные перед кодированием и после декодирования не будут иметь
смещений или дополнительных/потерянных сэмплов относительно друг друга. Это легко оценить,
когда вы кодируете non-stop музыку (когда один трек постепенно входит в другой) - в итоге
сохранится целостность звука. 
Возможностью потокового вещания сейчас никого не удивишь, но у этого формата она заложена
с самых основ. Это дает формату достаточно полезный побочный эффект - в одном файле можно
хранить несколько композиций с собственными тегами. При загрузке такого файла в плеер должны
отобразиться все композиции, будто их загрузили из нескольких различных файлов. 
Отдельно стоит упомянуть достаточно гибкую систему тегов. Заголовок тегов легко расширяется
и позволяет включать тексты любой длины и сложности (например, текст песни), перемежающиеся
изображениями (например, фотография обложки альбома). Текстовые теги хранятся в UTF-8, что
позволяет писать хоть на всех языках одновременно и исключает возможные проблемы с кодировками.
Это значительно удобнее различных ухищрений типа id3 тегов. 
Ogg Vorbis по умолчанию использует переменный битрейт, при этом значения последнего не
ограничены какими-то жесткими значениями, и он может варьироваться даже на 1kbps. При этом
стоит заметить, что форматом жестко не ограничен максимальный битрейт, и при максимальных
настройках кодирования он может варьироваться от 400kbps до 700kbps. Такой же гибкостью
обладает частота дискретизации - пользователям предоставляется любой выбор в пределах от
2000Hz до 192000Hz. 
Ogg Vorbis был разработан сообществом Xiphophorus для того, чтобы заменить все платные
запатентованные аудио форматы. Несмотря на то, что это самый молодой формат из всех
конкурентов МР3, Ogg Vorbis имеет полную поддержку на всех известных платформах (Windows,
PocketPC, Symbian, DOS, Linux, MacOS, FreeBSD, BeOS и др.), а также большое количество
аппаратных реализаций. Популярность на сегодняшний день значительно превосходит все
альтернативные решения.
