# 3. Выбор модели хранения данных

## Статус

Принято

## Контекст

Для работы Random Coffee Bot необходимо хранить различные типы данных:

- Профили пользователей с динамическим набором интересов
- Геолокационные данные
- Историю встреч
- Рейтинги и отзывы

Требования к модели хранения:

- Надежность и консистентность данных
- Эффективная работа с геоданными
- Поддержка транзакций
- Возможность сложных выборок для подбора пар
- Масштабируемость

## Решение

Использовать реляционную модель хранения данных.

Рассмотренные альтернативы:

1. Реляционная модель ✅
   - Плюсы: 
     - ACID транзакции
     - Строгая схема данных
     - Эффективные JOIN операции
     - Поддержка сложных запросов
   - Минусы: 
     - Менее гибкая схема данных
     - Необходимость нормализации

2. Документная модель
   - Плюсы: 
     - Гибкость схемы
     - Удобство хранения вложенных структур
   - Минусы:
     - Сложность поддержки консистентности
     - Избыточность данных
     - Менее эффективные сложные запросы

3. Графовая модель
   - Плюсы: 
     - Удобство работы со связями
   - Минусы: 
     - Излишняя сложность для наших задач
     - Ограниченная поддержка в облачных платформах

## Последствия

### Положительные

- Гарантированная консистентность данных
- Эффективные сложные запросы для подбора пар
- Возможность использования транзакций
- Хорошая поддержка в облачных платформах

### Отрицательные

- Необходимость явного описания схемы данных
- Сложнее вносить изменения в структуру данных
