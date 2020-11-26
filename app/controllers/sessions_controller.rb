class SessionsController < ApplicationController
    def new
    end

    def create

        pw = Digest::SHA256.hexdigest("p#{params[:members][:password]}k")
        @member = Member.find_by(account: params[:members][:account],
                               password: pw)

        if @member
            redirect_to root_path, "登入成功"
        else
            redirect_to sessions_users_path, "登入失敗"
        end
    end
end