class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def create
        tenant = Tenant.create!(name: params[:name], age: params[:age])
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(name: params[:name], age: params[:age])
        render json: tenant
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private
    def render_not_found
        render json: { error: "Tenant not found" }, status: :not_found
    end
end
