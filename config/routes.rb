Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score'
  # modifier avec un post pour score
end
