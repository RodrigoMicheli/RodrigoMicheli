class CarrinhoVendasController < ApplicationController
  include CarrinhoVendasHelper
  before_action :set_carrinho_venda, only: [:show, :edit, :update, :destroy]

  # GET /carrinho_vendas or /carrinho_vendas.json
  def index
    @carrinho_vendas = CarrinhoVenda.all
  end

  # GET /carrinho_vendas/1 or /carrinho_vendas/1.json
  def show
  end

  # GET /carrinho_vendas/new
  def new
    @vendas = Array.new
    @carrinho_venda = CarrinhoVenda.new
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # GET /carrinho_vendas/1/edit
  def edit
    renderiza :edit
  end

  # POST /carrinho_vendas or /carrinho_vendas.json
  def create
    @produtos = Produto.all
    @clientes = Cliente.all
    @carrinho_venda = CarrinhoVenda.new
    @vendas = session[:vendas]
    if @vendas == nil
      @vendas = Array.new
    end

    if params[:commit] == 'Adicionar Produto'
      @venda = Venda.new
      produto = params[:carrinho_venda][:venda].values
      @venda.produto_id = produto[0]
      @venda.quantidade = produto[1]
      @vendas << @venda
      session[:vendas] = @vendas
      renderiza :new
    end
    if params[:commit] == 'Salvar'
      respond_to do |format|
        @carrinho_venda = CarrinhoVenda.new(carrinho_venda_params)
        @vendaTotal = Array.new
        retorno = nil
        @vendas.each do |vend|
          if @carrinho_venda.id == nil
            @vendaFeita = retornarVenda(vend)
            @carrinho_venda = @vendaFeita.build_carrinho_venda(:cliente_id => @carrinho_venda.cliente_id, :avatar => @carrinho_venda.avatar )
            retorno = @carrinho_venda.save
            @vendaFeita.carrinho_venda_id = @carrinho_venda.id
            retorno = @vendaFeita.save
          else
            @vendafeita1 = retornarVenda(vend)
            @vendafeita1.carrinho_venda_id = @carrinho_venda.id
            retorno = @vendafeita1.save
          end
        end
        if retorno
          format.html { redirect_to @carrinho_venda, notice: "Carrinho venda was successfully created." }
          format.json { render :show, status: :created, location: @carrinho_venda }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @carrinho_venda.errors, status: :unprocessable_entity }
        end
      end
    end
    if params[:commit] == 'Limpar Vendas'
      session[:vendas] = nil
      renderiza :new
    end
  end

  # PATCH/PUT /carrinho_vendas/1 or /carrinho_vendas/1.json
  def update
    respond_to do |format|
      if @carrinho_venda.update(carrinho_venda_params)
        format.html { redirect_to @carrinho_venda, notice: "Carrinho venda was successfully updated." }
        format.json { render :show, status: :ok, location: @carrinho_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carrinho_venda.errors, status: :unprocessable_entity }
      end
    end
  end
  def renderiza(view)
    @clientes = Cliente.all
    @produtos = Produto.all
    render view
  end
  # Only allow a list of trusted parameters through.
  def carrinho_venda_params
    params.require(:carrinho_venda).permit(:cliente_id, :avatar)
  end
  # DELETE /carrinho_vendas/1 or /carrinho_vendas/1.json
  def destroy
    @carrinho_venda.destroy
    respond_to do |format|
      format.html { redirect_to carrinho_vendas_url, notice: "Carrinho venda was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrinho_venda
      @carrinho_venda = CarrinhoVenda.find(params[:id])
    end
end
