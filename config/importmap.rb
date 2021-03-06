# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tailwindcss-stimulus-components", to: "https://ga.jspm.io/npm:tailwindcss-stimulus-components@3.0.1/dist/tailwindcss-stimulus-components.modern.js"
pin "@mux/videojs-kit", to: "https://ga.jspm.io/npm:@mux/videojs-kit@0.7.0/dist/index.js"
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "local-time", to: "https://ga.jspm.io/npm:local-time@2.1.0/app/assets/javascripts/local-time.js"
