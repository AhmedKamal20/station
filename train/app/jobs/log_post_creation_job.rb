class LogPostCreationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Post Created"
  end
end
