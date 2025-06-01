class ApplyFineJob
  include Sidekiq::Worker

  def perform
    ApplyFines.call
  end
end