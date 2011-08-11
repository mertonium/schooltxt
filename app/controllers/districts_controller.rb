class DistrictsController < ApplicationController
  def index
    @districts = District.all 
    @district = District.new   
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts }
    end
  end
  
  def create
    @district = District.new(params[:district])

    respond_to do |format|
      if @district.save
        format.html { redirect_to :action => "index", :notice => 'The school district was successfully created.' }
        format.xml  { render :xml => @district, :status => :created, :location => @district }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end
end
