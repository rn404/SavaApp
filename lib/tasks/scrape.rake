namespace :scrape do

  desc "scraping chara data and publish CSV file"
  task :chara => :environment do
    sh "ruby tools/scrape/charaData.rb"
  end

end
