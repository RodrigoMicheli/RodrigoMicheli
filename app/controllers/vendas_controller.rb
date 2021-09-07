class VendasController < ApplicationController
  before_action :set_venda, only: [:edit, :update, :destroy]
  def new
    @venda = Venda.new
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  def edit
    renderiza :edit
  end

  def update
    if @venda.update venda_params
      flash[:notice] = "Produto atualizado com sucesso!"
      redirect_to vendas_path
    else
      renderiza :edit
    end
  end

  def destroy
    @venda.destroy
    redirect_to vendas_path
  end

  def show
    @venda = Venda.find(params[:id])
  end

  def index
    @vendas = Venda.all
  end

  def create
    @venda = Venda.new venda_params
    @produtos = Produto.all
    @clientes = Cliente.all
    respond_to do |format|
      if @venda.save
        format.html { redirect_to vendas_url, notice: 'Venda foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end
  def renderiza(view)
    @clientes = Cliente.all
    @produtos = Produto.all
    render view
  end
  # Only allow a list of trusted parameters through.
  def venda_params
    params.require(:venda).permit(:quantidade, :cliente_id, :produto_id, :avatar)
  end

  def set_venda
    @venda = Venda.find(params[:id])
  end

end
