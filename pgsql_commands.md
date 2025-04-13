# Команды для установки и настройки PostgreSQL в Docker

## Создание директории для данных PostgreSQL:
mkdir -p ~/postgresql/data

## Запуск контейнера PostgreSQL:
docker run --name postgresql -e POSTGRES_PASSWORD=my_password -d -p 5432:5432 -v ~/postgresql/data:/var/lib/postgresql/data postgres

## Проверка работы PostgreSQL:
docker exec -it postgresql psql -U postgres
