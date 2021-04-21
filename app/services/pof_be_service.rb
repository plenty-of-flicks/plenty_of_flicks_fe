class PofBeService
  def self.conn
    Faraday.new(url: ENV['POF_BE'])
  end
end
