class HomeController < ApplicationController
  def index
  end
  
  def upload
    file = params["file"].tempfile
    @results = Hash.new
    file.each do |line|
      v = line.split(',')
      type = v[2]
      if( type == ' UsageType' )
        next
      end
      val = v[6].to_i
      if @results[type].nil?
        @results[type] = val
      else
        @results[type] += val
      end
    end
    render "result"
  end

end
