# Rodar Projeto

### Dependências:

- Docker, Docker Compose


### Rodar aplicação:

- docker-compose build
- docker-compose run --rm app bundle exec rails db:create db:migrate db:seed
- docker-compose run --rm app bundle exec rails db:create db:migrate db:seed RAILS_ENV=test

- docker-compose up

Para rodar os testes:

- docker-compose run --rm app bundle exec rspec