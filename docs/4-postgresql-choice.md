# 4. Выбор PostgreSQL в качестве СУБД

## Статус

Принято

## Контекст

После выбора реляционной модели хранения (ADR-3) необходимо выбрать конкретную СУБД.

Требования к СУБД:
- Поддержка реляционной модели
- Надежность и производительность
- Поддержка геопространственных данных
- Хорошая интеграция с облачными платформами
- Активное сообщество и поддержка

## Решение

Использовать PostgreSQL в качестве основной базы данных.

Причины выбора:
- Надежная и производительная СУБД с открытым исходным кодом
- Отличная поддержка PostGIS для работы с геоданными
- Поддержка JSON для гибких структур данных
- Широкая поддержка в облачных платформах
- Большое сообщество и экосистема
- Богатый набор типов данных и индексов

## Последствия

### Положительные
- Надежное хранение данных с ACID гарантиями
- Эффективная работа с геоданными через PostGIS
- Возможность использования JSON полей для гибких данных
- Хорошая производительность сложных запросов

### Отрицательные
- Необходимость управления схемой базы данных
- Потребность в миграциях при изменении схемы 