class DeadlinesController < ApplicationController
  layout "dashboard"
  before_action :set_deadline, only: [:show, :edit, :update, :destroy]

  # POST /deadlines
  # POST /deadlines.json
  def create
    @deadline = Deadline.new(deadline_params)

    respond_to do |format|
      if @deadline.save
        format.html { redirect_to @deadline.listing, notice: 'Deadline was successfully created.' }
        format.json { render :show, status: :created, location: @deadline }
      else
        format.html { redirect_to(@deadline.listing || listings_url) }
        format.json { render json: @deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deadlines/1
  # PATCH/PUT /deadlines/1.json
  def update
    respond_to do |format|
      if @deadline.update(deadline_params)
        format.html { redirect_to @deadline, notice: 'Deadline was successfully updated.' }
        format.json { render :show, status: :ok, location: @deadline }
      else
        format.html { redirect_to edit_listing_path(@deadline.listing) }
        format.json { render json: @deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deadlines/1
  # DELETE /deadlines/1.json
  def destroy
    @deadline.destroy
    respond_to do |format|
      format.html { redirect_to listing_path(@deadline.listing), notice: 'Deadline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deadline
      @deadline = Deadline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deadline_params
      params.require(:deadline).permit(:date, :description, :listing_id)
    end
end
