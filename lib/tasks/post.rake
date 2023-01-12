namespace :post do
  desc "TODO"
  task check: :environment do
    CheckDraftJob.perform_later
  end

end
