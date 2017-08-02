get '/users/:id' do
	# authenticate!
	p session[:user_id]
	if current_user && params[:id]
		@user = User.find_by(id: session[:user_id])
		erb :'users/show'
	else
		erb :'404'
	end
end


post '/users' do 
	@user = User.new(params[:users])
	@user.password = params[:password]

	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}" 
	else
    @errors = @user.errors.full_messages
		erb :'users/new'
	end
end