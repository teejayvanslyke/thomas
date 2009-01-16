require 'spec/expectations'
require File.dirname(__FILE__) + '/../../lib/thomas'

Given /^I have specified congress (.*), bill (.*)$/ do |congress, bill|
  @congress = congress
  @bill     = bill
end

When /^I query for its metadata$/ do
  @result = Thomas::Bill.find(@congress, @bill)
end

Then /^it should be nil$/ do
  @result.should be_nil
end

Then /^its title is '(.*)'$/ do |title|
  @result.title.should == title
end

Then /^its sponsor is '(.*)'$/ do |sponsor|
  @result.sponsor.should == sponsor
end

Then /^it belongs to congress (.*)$/ do |congress|
  @result.congress.should == congress.to_i
end

Then /^its ID is (.*)$/ do |id|
  @result.id.should == id
end

Then /^its introduction date is (.*)$/ do |date|
  @result.introduced_on.should == Date.parse(date)
end

Then /^it has no cosponsors$/ do
  @result.cosponsors.should be_empty
end

Then /^it has ([0-9]+) cosponsors$/ do |count|
  @result.cosponsors.size.should == count.to_i
end

Then /^'(.*)' is a cosponsor$/ do |name|
  @result.cosponsors.should include(name)
end

