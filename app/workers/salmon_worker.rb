# frozen_string_literal: true

class SalmonWorker
  include Sidekiq::Worker

  def perform(account_id, body)
    ProcessInteractionService.new.call(body, Account.find(account_id))
  end
end
