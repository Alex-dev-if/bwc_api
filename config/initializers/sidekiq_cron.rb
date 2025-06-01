require 'sidekiq/cron/job'

Sidekiq::Cron::Job.create(
  name: 'Rodar tarefa diária às 00h',
  cron: '0 0 * * *',
  class: 'ApplyFineJob'
)
