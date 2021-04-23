require 'rails_helper'

describe 'user poro' do
  it 'has readable attributes' do
    user_data = {
      data: {
        id: "1",
        type: "user",
        attributes: {
          first_name: "Nick",
          last_name: "King",
          email: "nickmaxking@gmail.com",
          uid: "12345678910",
          image:
          "https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg"
        }
      }
    }

    user = User.new(user_data)

    expect(user).to be_a(User)
    expect(user.id).to eq(1)
    expect(user.first_name).to eq('Nick')
    expect(user.last_name).to eq('King')
    expect(user.email).to eq('nickmaxking@gmail.com')
    expect(user.uid).to eq('12345678910')
    expect(user.image).to eq('https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg')
  end
end
