# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers', preload: true
pin '@hotwired/turbo-rails', to: 'https://ga.jspm.io/npm:@hotwired/turbo-rails@7.3.0/app/javascript/turbo/index.js', preload: true
pin '@hotwired/turbo', to: 'https://ga.jspm.io/npm:@hotwired/turbo@7.3.0/dist/turbo.es2017-esm.js', preload: true
pin '@rails/actioncable/src', to: 'https://ga.jspm.io/npm:@rails/actioncable@7.0.5/src/index.js', preload: true
pin '@rails/actioncable', to: 'https://cdn.jsdelivr.net/npm/@rails/actioncable@7.0.5/app/assets/javascripts/actioncable.esm.js'
pin 'stimulus', to: 'https://ga.jspm.io/npm:stimulus@3.2.1/dist/stimulus.js', preload: true
pin 'flatpickr', to: 'https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js'
pin "star-rating.js", to: "https://cdn.jsdelivr.net/npm/star-rating.js@4.3.0/dist/star-rating.esm.js"
pin 'sweetalert2', to: 'https://ga.jspm.io/npm:sweetalert2@11.7.12/dist/sweetalert2.all.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
