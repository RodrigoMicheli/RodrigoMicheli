module CarrinhoVendasHelper

  def nomeProduto(venda)
    ven = retonarVenda(venda)
    produto = Produto.find_by(id: ven.produto_id)
    nome = produto.nome
  end

  def quantidade(venda)
    ven = retonarVenda(venda)
    quantidade = ven.quantidade
  end

  def vendeas
    session[:vendas]
  end

  def retonarVenda(venda)
    if  venda.class.to_s == 'Hash'
      vendeas = Venda.new(venda)
    else
      vendeas = venda
    end
  end
end
