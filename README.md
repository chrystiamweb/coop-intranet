## Intranet 

This is a simple intranet created with rails and materialize 

### Prerequisites

* ImageMagick (https://www.imagemagick.org)

```
sudo apt-get update
sudo apt-get install imagemagick libmagickwand-dev
```

### Installing

This project use postgres as database, first you need to change the database config on file config/database.yml.example

```
vim config/database.yml.example (make the changes and save the file)

cp config/database.yml.example config/database.yml (create the database.yml config file)
```

Create database and migrations

```
rails db:create
rails db:migrate
```
### Usage

* After start you app, you need to create an user to get access to the posts area, then log on and the menu will be available.


## Built With
* [Devise](https://github.com/plataformatec/devise)
* [Ckeditor](https://ckeditor.com/)
* [MaterializeCss](https://materializecss.com/)
* [paperclip](https://github.com/thoughtbot/paperclip)

