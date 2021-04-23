class AdminFacade
  def self.refresh_service_availability(service)
    availability_data = BackendService.refresh_availability(service)
    Refresh.new(availability_data)
  end

  def self.update_movie_details
    data = BackendService.update_details
    MovieDetailsUpdate.new(data)
  end
end
