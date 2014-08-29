# .-.aliases.ruby
# Used to add anything Ruby specific

if (exists ruby); then
    test "$SILENT" == false && echo -e "*\tRuby\t\t\t\t*"
    
    # rbenv 
    alias rehash='rbenv rehash'
    alias bi='bundle install; rbenv rehash'

    # rake
    alias ri='rake install'
    alias rd='rake deploy'
    alias bi='bundle install'
    alias deploy='rake deploy'

    #  Octopress
    alias octo_preview='rake preview'
    alias octo_generate='rake generate'

    # Rails
    alias db_console='rails dbconsole'
    alias rg='rails generate'
    alias routes='rake routes'
    alias rr='rake routes'
    alias rs='rails server'
    alias rsd='rails server -d'
    alias migrate='rake db:migrate'

    alias tail_production="tail -f log/production.log"
    alias tail_development="tail -f log/development.log" 
fi