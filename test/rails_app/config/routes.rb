RailsApp::Application.routes.draw do
  calliope :blog, :news
  root :to => "home#index"
end
