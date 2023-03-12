class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def create
        lease = Lease.create(apartment_id: params[:apartment_id], tenant_id: params[:tenant_id], rent: params[:rent])
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private
    def render_not_found
        render json: { error: "Lease not found" }, status: :not_found
    end
end
