require 'csv'


Page.delete_all
PalType.delete_all
Type.delete_all
PalDrop.delete_all
Drop.delete_all
Pal.delete_all
Region.delete_all

#fetch the filename
filename = Rails.root.join("db/palworld.csv")

puts "Loading Pals from the CSV file: #{filename}"

csv_data = File.read(filename)
pals = CSV.parse(csv_data, headers: true, encoding: "utf-8")

pals.each do |p|
  region = Region.find_or_create_by(name: p["Region"])
  if region && region.valid?
    pal = region.pals.create(
      name:   p["Name"],
      title:  p["Title"],
      skill:  p["Skill"],
      hp:     p["HP"],
      attack: p["Attack"],
      speed:  p["Speed"],
      rarity: p["Rarity"],
    )

    puts "Invalid pal #{p["Name"]}" unless pal&.valid?

    types = p["Type"].split(",").map(&:strip)

    types.each do |type_name|
      type = Type.find_or_create_by(name: type_name)
      PalType.create(pal: pal, type: type)
    end

    drops = p["Drops"].split(",").map(&:strip)

    drops.each do |drop_name|
      drop = Drop.find_or_create_by(name: drop_name)
      PalDrop.create(pal: pal, drop: drop)
    end

  else
    puts "Invalid region #{p["Region"]} for pal #{p["Name"]}"
  end
end

puts "Created #{Region.count} Regions"
puts "Created #{Pal.count} Pals"
puts "Created #{Type.count} Types"
puts "Created #{PalType.count} Pal Types"
puts "Created #{Drop.count} Drops"
puts "Created #{PalDrop.count} Pal Drops"

Page.create(
  title: 'About the data',
  context: 'The data powering this great website was supplied by Kaggle.',
  permalink: "about"
)
Page.create(
  title: 'Contact Us',
  context: 'If you like this site and want to chat, please reach out!',
  permalink: "contact"
)