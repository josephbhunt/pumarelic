# pumarelic

## Instalation
Using gems
```
gem i pumarelic
```

Using bundler

in Gemfile
```
gem 'pumarelic'
```

in your puma.rb config file
```
plugin 'pumarelic'
```

## How to contribute

Please create an issue if you find a bug.

For improvements and bug fixes please fork this repository and create a PR.

### Development with Docker
This repo already has a Docker file and docker-compose.yml. If you wish to use docker then do the following.

```
docker-compose run pumarelic /bin/bash
```

This is put you a bash session in the container. From here you can run `bundle install` and other commands that require running Ruby scripts and using gems.
