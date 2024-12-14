# 6. Выбор технологического стека

## Статус

Принято

## Контекст

Необходимо выбрать технологический стек для реализации Telegram бота.

Требования:

- Современный и производительный runtime
- Типизация для безопасной разработки
- Удобная работа с асинхронными операциями
- Хорошая экосистема библиотек
- Простота развертывания

## Решение

Использовать следующий стек технологий:

- Deno в качестве runtime
- TypeScript для разработки
- GrammyJS для работы с Telegram Bot API
- Deno KV для управления состояниями

Причины выбора:

1. Deno:
   - Встроенная поддержка TypeScript
   - Современный и безопасный runtime
   - Простота развертывания
   - Встроенные инструменты форматирования и тестирования
   - Встроенное key-value хранилище (Deno KV)

2. TypeScript:
   - Строгая типизация
   - Улучшенная поддержка IDE
   - Меньше ошибок во время выполнения

3. GrammyJS:
   - Возможность описывать бота в виде набора бизнес-правил
   - Современная библиотека для Telegram Bot API
   - Хорошая поддержка TypeScript
   - Удобная система middleware
   - Поддержка разговоров (conversations)

4. Deno KV:
   - Встроенная поддержка в Deno Deploy
   - Атомарные операции
   - Глобальная репликация
   - Простой API для работы с состояниями
   - Возможность использования как очередь сообщений

## Последствия

### Положительные

- Современный и безопасный стек технологий
- Отличная поддержка типов
- Простота развертывания
- Единый язык на всех уровнях приложения

### Отрицательные

- Библиотеки, используемые низкоуровневое node API могут быть недоступны для Deno