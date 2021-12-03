class ProdutosController < ApplicationController
	before_action :set_produto, only: [:show, :edit, :update, :destroy]
	def index
       @produtos = Produto.order(nome: :asc).limit 6
	     @produto_com_desconto = Produto.order(:preco).limit 4

    end
	
	def create
		@produto = Produto.new produto_params
		if @produto.save
			flash[:notice] = "Produto salvo com sucesso!"
			redirect_to root_path
		else
			renderiza :new
		end
		
    end
	
	def edit
		renderiza :edit
	end
	
	def destroy
		@produto.destroy
		redirect_to root_url
	end
	
	def busca
		@nome = params[:nome]
		@produtos = Produto.where  "nome like ?", "%#{@nome}%"

	end
	
	def new 
		@produto = Produto.new 
		#@clientes = Cliente.all
	end
	
	def update
		if @produto.update produto_params
			flash[:notice] = "Produto atualizado com sucesso!"
			redirect_to root_url
		else
			renderiza :edit
		end
	end

	def show
		@produto = Produto.find(params[:id])
	end
	
	private
	
	def produto_params
		params.require(:produto).permit(:nome, :descricao, :preco,
		:quantidade, :codigo)
	end
	
	def renderiza(view)
		@clientes = Cliente.all
		render view
	end
	
	def set_produto
		@produto = Produto.find(params[:id])
	end
	
end
