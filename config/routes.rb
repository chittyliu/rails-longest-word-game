Rails.application.routes.draw do
  get 'new', to: "games#new", as: :new
  # get 'contact', to: "games#contact", as: :contact
  get 'score', to: "games#score", as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
