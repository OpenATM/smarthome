class User
  attr_accessor :username, :password
end
class AjaxController < ApplicationController
  def ajax_test

  end
  def ajax_result
  	  puts "---------------------->ajax_result:#{params[:id].class}-------------------------"
      @user2 = User.new
      @user1 = User.new
      @user2.username = "hj"
      @user2.password = "123"
      @user1.username = "jun"
      @user1.password = "13"
      @users = [@user1,@user2]
  	  respond_to do |format|
   	  	if params[:id].to_i != 0 
          #format.json {render :json => { :status => true }}
          format.json {render :json => {:success => true} }
        else
          format.json {render :json => {:success => false} }
        end
      end
  	  #format.js { render :mydata => false }
  end
end
