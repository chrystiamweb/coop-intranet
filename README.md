## Intranet 

This is a simple intranet created with rails and materialize 

### Prerequisites

>You just need have docker-compose installed in your machine.

### Getting Started
>To get the app running, run the following commands:

```
docker-compose build
docker-compose up
docker-compose exec web bundle exec rails db:create
docker-compose exec web bundle exec rails db:migrate
docker-compose exec web bundle exec rails db:seed  
```
### Usage

* Log in and menu will be available

>Default User 
```
Login: Admin
Password: 123456
```

## Built With
* [Devise](https://github.com/plataformatec/devise)
* [Ckeditor](https://ckeditor.com/)
* [MaterializeCss](https://materializecss.com/)
* [paperclip](https://github.com/thoughtbot/paperclip)

