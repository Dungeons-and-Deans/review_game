if Rails.env.production?
  Thread.new { EventMachine.run } unless EventMachine.reactor_running? && EventMachine.reactor_thread.alive?
end
