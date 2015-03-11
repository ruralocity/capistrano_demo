# Capistrano demo

Sample application for my presentation on Capistrano at KC Ruby, March, 2015.

- Aaron Sumner
- @ruralocity (Twitter, GitHub)

## Setup

### Server-side

- see bootstrap.sh for basic server configuration

#### Where I cheated:

- using vagrant user for deploys
- using sqlite3 in production
- secrets are in repo (but part of server provisioning)

### App-side

- refer to Gemfile for dependencies
- `bundle exec cap install`
- customize Capfile, config/deploy.rb, and config/deploy/<env>.rb as needed

## Deploying

- `cap <env> deploy`

## Rollback

- `cap <env> deploy:rollback`

## Custom tasks

- see lib/capistrano/tasks/uptime.rake

## Resources

- [Capistrano documentation](http://capistranorb.com)
- [Deploying Rails](https://pragprog.com/book/cbdepra/deploying-rails) (out of
  print and out of date)
- [Railscasts series on
  Capistrano](http://railscasts.com/episodes?search=capistrano) (out of date)
- [Walkthrough of deploying Rails on a VM using
  Capistrano](http://azure.microsoft.com/en-us/documentation/articles/virtual-machines-ruby-deploy-capistrano-host-nginx-unicorn/)

## Alternatives

- [Mina](https://github.com/mina-deploy/mina)
- [Vlad](http://rubyhitsquad.com/Vlad_the_Deployer.html)
