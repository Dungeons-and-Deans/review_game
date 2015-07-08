Rails.application.routes.draw do
  get 'class_gameplay/:id/home' => 'class_gameplay#home'

  get 'student_gameplay/login'
  post 'student_gameplay/login'
  get 'student_gameplay/logout'
  get 'student_gameplay/:id/home/:group_id' =>'student_gameplay#home'

  get 'teacher_gameplay/:id/home' => 'teacher_gameplay#home'
  get 'teacher_gameplay/:id/groups' => 'teacher_gameplay#groups'
  get 'teacher_gameplay/:id/supply/:group_id' => 'teacher_gameplay#supply'
  post 'teacher_gameplay/:id/assign_supply' => 'teacher_gameplay#assign_supply'
  get 'teacher_gameplay/:id/competition' => 'teacher_gameplay#competition'
  patch 'teacher_gameplay/:id/update_score/:group_id' => 'teacher_gameplay#update_score'
  get 'teacher_gameplay/:id/edit_score/:group_id' => 'teacher_gameplay#edit_score'
  patch 'teacher_gameplay/:id/next_group' => 'teacher_gameplay#next_group'

  devise_for :teachers
  root 'games#index'
  resources :games
  resources :students
  resources :categories

  get 'categories/:id/edit_question/:question_id' => 'categories#edit_question'
  patch 'categories/:id/update_question/:question_id' => 'categories#update_question'

  get 'game_sessions/new'
  post 'game_sessions/create'
  get 'game_sessions/:id/groups' => 'game_sessions#groups'
  delete 'game_sessions/:id/destroy' => 'game_sessions#destroy'
  patch 'game_sessions/:id/assign_groups' => 'game_sessions#assign_groups'
  get 'game_sessions/add_player/:group_id/:student_id' => 'game_sessions#add_player'
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
