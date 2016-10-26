json.extract! customer, :id, :l_name, :f_name, :email, :address, :city, :country, :credit_id, :password_digest, :created_at, :updated_at
json.url customer_url(customer, format: :json)