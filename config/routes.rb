Rails.application.routes.draw do

  get 'pages/home'
  get 'faq' => 'pages#faq'
  get 'help' => 'pages#help'

  resources :notes
  devise_for :teachers
  resources :games
  resources :students
  resources :categories do
    member do
      patch 'update_title'
    end
  end
  resources :questions

  root 'games#index'

  get 'class_gameplay/:id/home' => 'class_gameplay#home', as: :class_gameplay

  get 'student_gameplay/login'
  post 'student_gameplay/login'
  get 'student_gameplay/logout'
  get 'student_gameplay/:id/home/:group_id' =>'student_gameplay#home', as: :student_gameplay

  get 'teacher_gameplay/:id/home' => 'teacher_gameplay#home', as: :teacher_gameplay
  get 'teacher_gameplay/:id/groups' => 'teacher_gameplay#groups', as: :groups
  patch 'teacher_gameplay/:id/update_score/:group_id' => 'teacher_gameplay#update_score', as: :update_score
  get 'teacher_gameplay/:id/edit_score/:group_id' => 'teacher_gameplay#edit_score', as: :edit_score
  patch 'teacher_gameplay/:id/next_group' => 'teacher_gameplay#next_group', as: :next_group
  get 'teacher_gameplay/:id/active/:student_id' => 'teacher_gameplay#active', as: :active
  patch 'teacher_gameplay/:id/next_question/:question_id' => 'teacher_gameplay#next_question', as: :next_question
  post 'teacher_gameplay/send_message', as: :send_message

  get 'game_sessions/:game_id/new' => 'game_sessions#new', as: :new_game_session
  post 'game_sessions/:game_id/create' => 'game_sessions#create', as: :create_game_session
  get 'game_sessions/:id/groups' => 'game_sessions#groups', as: :game_session_groups
  delete 'game_sessions/:id/destroy' => 'game_sessions#destroy', as: :delete_game_session
  patch 'game_sessions/:id/assign_groups' => 'game_sessions#assign_groups', as: :assign_groups
  post 'game_sessions/add_player/:group_id/:student_id' => 'game_sessions#add_player', as: :add_player
  patch 'game_sessions/:id/end_game' => 'game_sessions#end_game', as: :end_game



  post 'supplies/:id/create' => 'supplies#create', as: :supply
  get 'supplies/:id/edit/:supply_id' => 'supplies#edit', as: :edit_supply
  patch 'supplies/:id/update/:supply_id' => 'supplies#update', as: :update_supply
  delete 'supplies/:id/destroy/:supply_id' => 'supplies#destroy', as: :delete_supply

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
