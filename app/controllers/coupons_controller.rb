class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    #Coupon.new allows the code to give a blank form and not create an id until post method is done
    @coupon = Coupon.new
  end

  def post 
    # coupon_params is a private method b/c using athication tokens
    coupon = Coupon.create(coupon_params)
    #set the create to coupon which holds the id
    #when I call the redirect_to I use the coupon to pull new id
    redirect_to coupon_path(coupon)
  end 

  def edit
  end

  private 
  def coupon_params
    params.require(:coupon).permit(:coupon_code, :store)
  end   
end
