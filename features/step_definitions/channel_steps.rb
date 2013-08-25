Given /^the following channels:$/ do |channels|
  Channel.create!(channels.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) channel$/ do |pos|
  visit channels_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following channels:$/ do |expected_channels_table|
  expected_channels_table.diff!(tableish('table tr', 'td,th'))
end

When /^I delete the channel id (\d+)$/ do |id|
  within("channel_#{id}") do
    click_link "Destroy"
  end
end

When /^I reload the page$/ do
  # puts "DEBUG - The page for #{current_path}"
  Capybara::current_driver
end

Given /^I am visit the home page$/ do
  visit "/"
end