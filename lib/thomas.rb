$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
gem     'hpricot'
require 'hpricot'

gem     'activesupport'
require 'activesupport'
require 'open-uri'

module Thomas

  class Bill

    attr_reader :congress, :id

    def self.url(congress, id)
      id[/(HR|HE)([0-9]+)/]
      return nil if congress.to_s.length > 3
      congress_for_url = ( '0' * (3 - congress.to_s.length) ) + congress.to_s
      bill_for_url     = $1 + ( '0' * (5 - $2.length) ) + $2
      return "http://thomas.loc.gov/cgi-bin/bdquery/z?d#{congress_for_url}:#{bill_for_url}:@@@P"
    end

    def self.find(congress, id)
      url     = url(congress, id)
      return nil unless url
      doc     = Hpricot(open(url))
      return nil if (doc / '#content').inner_html.to_s.include?('ERROR')
      result  = new(congress, id, doc)
      if result.title.blank?
        return nil
      else
        return result
      end
    end

    def title 
      (@doc / 'b').select {|e| e.inner_html == 'Title:'}.first.next.to_s.strip
    end

    def sponsor
      (@doc / 'b').select {|e| e.inner_html.include? 'Sponsor:'}.first.next.inner_html.to_s.strip
    end

    def introduced_on
      str = (@doc / 'b').select {|e| e.inner_html.include? 'Sponsor:'}.first.next.next.to_s
      str[/\(introduced (.*)\)/]
      Date.parse($1)
    end

    def cosponsors 
      title = @doc.at("a[@name='cosponsors']")
      return [] unless title
      list = title.siblings_at(2).first
      return [] unless list 
      items = (list / 'a')
      return [] unless items
      items.map {|e| e.inner_html.to_s}
    end

    private 

    def initialize(congress, id, doc)
      @congress = congress.to_i
      @id       = id
      @doc      = doc
    end


  end

end
