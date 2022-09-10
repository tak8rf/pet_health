class Users::InvitationsController < Devise::InvitationsController
    def new
      super
    end
  
    def create
      super
      # User.find_by(email: params[:user][:email]).families.build(params[:user][:family_id])
      @group = Group.new
      @group.user_id = User.find_by(email: params[:user][:email]).id
      @group.family_id = params[:user][:family_id]
      @group.save
    end
  
    def edit
      super
    end

    def show
      super
    end
  
    def update
      super
    end
  
    def destroy
      super
    end
  end