RallyApp::Application.routes.draw do
  root to: "causes#index"
  resources :causes
end
