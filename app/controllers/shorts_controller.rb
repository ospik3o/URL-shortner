class ShortsController < ApplicationController
  # GET /shorts/1
  def show
    @short = Short.find(params[:id].to_i(36))

    respond_to do |format|
      format.html { redirect_to @short.long }
    end
  end

	# GET /shorts/new
	def new
		@short = Short.new

		respond_to do |format|
			format.html # new.html.erb
		end
	end

  # POST /shorts
  def create
    @short = Short.new(params.permit![:short])

    respond_to do |format|
      if @short.save
        format.html { render action: "show" }
      else
        format.html { render action: "new" }
      end
    end
  end
end
