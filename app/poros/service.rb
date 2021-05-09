class Service
  attr_reader :name,
              :logo

  def initialize(service_info)
    @name = service_info[:name]
    @logo = service_info[:logo]
  end
end
