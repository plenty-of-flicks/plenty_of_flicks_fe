class RefreshFacade
  def self.refresh_availability(service)
    RefreshService.refresh_availability(service)
  end
end
