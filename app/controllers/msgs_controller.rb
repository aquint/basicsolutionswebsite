class MsgsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", except:
	[:create, :new]
	def new
		@msg = Msg.new
	end
	def show
		@msg = Msg.find(params[:id])
	end
	def index
		@msgs = Msg.all
	end
	def create
		@msg = Msg.new(msg_params)
		if @msg.save
			flash[:success] = "Post successful!"
	      	redirect_to new_msg_path
	    else
	    	flash[:danger] = "Error, one or more fields incorrectly filled"
	    	redirect_to new_msg_path
		end
		
	end
	def destroy
		@msg = Msg.find(params[:id])
		@msg.destroy

		redirect_to msgs_path
	end
	private
	def msg_params
		params.require(:msg).permit(:name, :email, :comments)
	end
end
