# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#puts "=== Removing all current tags and customfields..."

ActiveRecord::Base.connection.execute('TRUNCATE customfields RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE taggings RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE tags RESTART IDENTITY')
ActiveRecord::Base.connection.execute('DROP TABLE tag1s') rescue nil
ActiveRecord::Base.connection.execute('DROP TABLE tag2s') rescue nil
ActiveRecord::Base.connection.execute('DROP TABLE tag3s') rescue nil

puts "=== Setting up tags and customfields..."

# ----------------------------------------------------------------------

tags = YAML.load <<EOS
---
LocalOrder:
  Main Activity:
    type: select_list
    select_options: "Adoption Services | Arts, Music & Culture | Children & Youth | Community Development | Disability Issues | Domestic Workers' Support | Education & Literacy | Environmental Conservation | Fair Trade | Faith-based Activities | Family Welfare & Gender Issues | Health & Medicine | Homeless & Housing | Microbusiness & Microcredit | Orphan Care | Recent Immigrants | Recycling & Reuse | Rehabilitation - Following Drug Abuse | Rehabilitation - Other | Seniors and Retirement Issues | Service Organisation | Sports & Recreation | Suicide Prevention | Support for People with Autism | Support for People with Epilepsy | Vocational Training & Employment | Wildlife and Animal Welfare | Women's Support"
    info: The main activity these goods will be used for.

  Follow-up Permitted:
    type: checkbox
    info: Is Crossroads welcome to request a follup-up visit to see the impact the goods are having?

  SWD Client ID:
    type: short_answer
    info: For transparency, it is useful to provide a HKID for individuals receiving aid from Crossroads.

  SWD Reference:
    type: short_answer
    info: Case reference, provided by Social Welfare Department

  SWD Client Name:
    type: short_answer
    info: The client is the actual recipient of the goods.

  Collect Date:
    type: date
    required: true

SWD:
  Description:
    type: long_answer
    info: A short description of this organisation.

NGO:
  Description:
    type: long_answer
    info: A short description of this organisation.
  Registration:
    type: long_answer
    info: The registration number of this NGO.
EOS

tags.each do |tag_name, fields|
  tag = ActsAsTaggableOn::Tag.find_or_create_by_name tag_name
  fields.each do |label, params|
    c = Customfield.find_or_create_by_field_label_and_tag_id :tag_id          => tag.id,
                                                             :field_label     => label,
                                                             :form_field_type => params["type"],
                                                             :field_info      => params["info"],
                                                             :select_options  => params["select_options"],
                                                             :required        => !!params["required"]                                                           
  end
end

# ----------------------------------------------------------------------

puts "===== Done."
