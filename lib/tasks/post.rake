namespace :post do
  desc 'Check draft post to delete'
  task check: :environment do
    CheckDraftJob.perform_later
  end
end
