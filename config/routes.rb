Wdiportal::Application.routes.draw do

  resources :gists, :resources, :events, :projects, :assignments, :labs, :squads

  root :to => "site#home"

  get "/site/home", to: "site#home"
  get "/site/about", to: "site#about"

  get "/remove/:student/from/:squad", to: "squads#remove_student"
  get "/add/:student/to/:squad", to: "squads#add_student"

  get "/users/:id/role", to: "users#form", as: :role_form
  patch "/users/:id/role", to: "users#change_role", as: :change_role

  get "/events/:id/rsvp", to: "events#rsvp", as: :rsvp

  get "/resetsquads", to: "squads#reset", as: :reset_squads

  devise_for :users

  devise_scope :user do
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end

  get "/users/:id", to: "users#show", as: :user
  get "/users", to: "users#index"

  get "/projects/:id/join", to: "projects#join", as: :join_project

end
