class AdminFacade
  def self.refresh_service_availability(service)
    availability_data = AdminService.refresh_availability(service)
    Refresh.new(availability_data)
  end

  def self.update_movie_details
    data = AdminService.update_details
    MovieDetailsUpdate.new(data)
  end
end
