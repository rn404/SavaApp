require 'csv'

namespace :capture do

  desc "chapture chara data to DB"
  task :chara => :environment do
    file_name = ARGV[1]

    CSV.foreach(Rails.root.join("tmp", file_name), "r") do |row|
      idx = row.index {|v| !v.nil? }

      name = row[idx]
      chara_id = row[idx+1]
      race = Chara.race_type_of row[idx+2]
      reality = Chara.reality_type_of row[idx+3]

      style = Style.type_of row[idx+4]
      element = Element.type_of row[idx+5]

      # TODO 複数設定されているときがある
      weapon = Weapon.type_of row[idx+6]

      begin
        record = Chara.create(
          name: name, chara_id: chara_id, race: race, reality: reality,
          style: style, element: element, weapon: weapon
        )
      rescue => e
        puts e
      end

    end

    # NOTE: task errorを握りつぶす
    ARGV.slice(1,ARGV.size).each{|v| task v.to_sym do; end}
  end

end

