class UsersController < ApplicationController

  def index
    relation = UserDecorator.decorate_collection(User.all)
    @users = OrderedByTypeQuery.new.call(relation)
    reset_session
  end

  def show
    @user = User.find(params[:id]).decorate
    session[:current_user_id] = @user.id
    @users = User.where("id != '#{params[:id]}'").order(:type)
    relation = LogDecorator.decorate_collection(Log.all)
    @logs = OrderedByDateQuery.new.call(relation)
  end

  def edit
    @user = User.find(params[:id]).decorate
  end

  def update
    @user = User.find(params[:id])
    @form = UserForm.new(user_params(@user.type)
    .merge("id" => params[:id], "login" => params[:login], "name" => params[:name]))

    if @form.presist
      @form.add_record_to_log
      redirect_to user_path(session[:current_user_id]), notice: "#{@form.login} was successfully updated!"
    else
      render :edit
    end
  end

  private 
    def user_params(type)
      params.require(type.underscore.to_sym).permit(:login, :name, :type)
    end
end
