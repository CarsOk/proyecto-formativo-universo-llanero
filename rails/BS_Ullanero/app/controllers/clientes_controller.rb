class ClientesController < ApplicationController
  skip_before_action :verify_authenticity_token
 
  def index
    clientes = Cliente.all 
    render json: clientes, status: 200
  end
  def show
    cliente =  Cliente.find(params[:id])
    render json: cliente, status: 200
  end
  def create 
    cliente = Cliente.create(
    nombre: params[:nombre],
    apellido: params[:apellido],
    frecuente: params[:frecuente]
    )
    
    if cliente.save
      render json: cliente, status: 201
    else
      render json: {error: "Problemas al guardar"}, status: 422
    end
  end 
  
end
