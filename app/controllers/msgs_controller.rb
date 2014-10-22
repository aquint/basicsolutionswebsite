class MsgsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", except:
	[:create, :new, :show]
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
		@msg.save
		redirect_to @msg
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
