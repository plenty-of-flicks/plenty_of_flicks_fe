require 'rails_helper'

describe 'current user poro' do
  it 'has readable attributes' do
    user_data = {
      "id"=>1,
      "first_name"=>"Nick",
      "last_name"=>"King",
      "email"=>"nickmaxking@gmail.com",
      "uid"=>"12345678910",
      "image"=>"https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg"
    }

    current_user = CurrentUser.new(user_data)

    expect(current_user).to be_a(CurrentUser)
    expect(current_user.id).to eq(1)
    expect(current_user.first_name).to eq('Nick')
    expect(current_user.last_name).to eq('King')
    expect(current_user.email).to eq('nickmaxking@gmail.com')
    expect(current_user.uid).to eq('12345678910')
    expect(current_user.image).to eq('https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg')
  end
end
