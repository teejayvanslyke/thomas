$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'hpricot'
require 'open-uri'

module Thomas

  class Bill

    def url(id)
      id[/(HR|HE)([0-9]+)/]
      prefix     = $1
      puts prefix
      id_for_url = ( '0' * (4 - $2.length) ) + $2
      return "http://thomas.loc.gov/cgi-bin/bdquery/z?d111:#{prefix}#{id_for_url}:@@@P"
    end

    def self.find(id)
      new(id)
    end

    def initialize(id)
      @doc = Hpricot(open(url(id)))
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

  end

end
