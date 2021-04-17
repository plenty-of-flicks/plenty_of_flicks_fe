class RefreshFacade
  def self.refresh_availability(service)
    availability_data = RefreshService.refresh_availability(service)
    Refresh.new(availability_data)
  end
end
