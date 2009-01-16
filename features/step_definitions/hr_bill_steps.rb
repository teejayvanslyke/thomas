require 'spec/expectations'
require File.dirname(__FILE__) + '/../../lib/thomas'

Given /^I have specified the ID (.*)$/ do |id|
  @id = id
end

When /^I query for its metadata$/ do
  @result = Thomas::Bill.find(@id)
end

Then /^its title is '(.*)'$/ do |title|
  @result.title.should == title
end

Then /^its sponsor is '(.*)'$/ do |sponsor|
  @result.sponsor.should == sponsor
end

Then /^its introduction date is (.*)$/ do |date|
  @result.introduced_on.should == Date.parse(date)
end

Then /^it has no cosponsors$/ do
  @result.cosponsors.should be_empty
end

