command Rlang execute "tabnew config/locales/en.yml | vsplit config/locales/fr.yml"
command RlangProfile execute "tabnew config/locales/my_profile.en.yml | vsplit config/locales/my_profile.fr.yml"
command RlangDevise execute "tabnew config/locales/devise.en.yml | vsplit config/locales/devise.fr.yml"

"For vim-rails
"help -> :help rails-projection
let g:rails_projections = {
      \ "app/decorators/*_decorator.rb": {
      \   "command": "decorator",
      \   "template":
      \     "class %SDecorator < ApplicationDecorator\nend",
      \   "test": [
      \     "spec/decorators/%s_decorator_spec.rb"
      \   ],
      \   "alternate": 'app/models/%s.rb'
      \ },
      \ "spec/fabricators/*_fabricator.rb": {
      \   "command": "fabricator",
      \   "template":
      \     "Fabricate(:%S)\nend",
      \   "test": [
      \     "spec/models/%s_spec.rb"
      \   ],
      \ },
      \ "app/repository/*_repository.rb": {
      \   "command": "repository",
      \   "template":
      \     "class %SRepository\nend",
      \   "test": [
      \     "spec/repository/%s_repository_spec.rb"
      \   ],
      \ },
      \ "app/assets/stylesheets/*css": {
      \   "command": "css",
      \ },
      \ "app/assets/javascripts/*js": {
      \   "command": "javascript",
      \ },
      \ "features/support/*.rb": {"command": "support"},
      \ "features/support/env.rb": {"command": "support"}
      \}
