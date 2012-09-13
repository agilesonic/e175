class HomeController < ApplicationController
  def index
  end
  
  def upload
    file = params["file"].tempfile
    @results = Hash.new
    file.each do |line|
      v = line.split(',')
      type = v[2]
      val = to_i(v[6])
      if @results[type].ni?
        @result[type] = val
      else
        @result[type] += val
      end
    end
    render "result"
  end

end
