WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.

  namespace :movements do
    subscribe :move_icon, :to => GameplayCommunicationController, :with_method => :move_icon
    subscribe :initial_placements, :to => GameplayCommunicationController, :with_method => :place_icon
    subscribe :ask_question, to: GameplayCommunicationController, with_method: :send_question
    subscribe :ask_competition_question, to: GameplayCommunicationController, with_method: :send_competition_question
    subscribe :answer_competition_question, to: GameplayCommunicationController, with_method: :answer_competition_question
  end
end
