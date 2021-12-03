module CarrinhoVendasHelper

  def nomeProduto(venda)
    ven = retornarVenda(venda)
    produto = Produto.find_by(id: ven.produto_id)
    nome = produto.nome
  end

  def quantidade(venda)
    ven = retornarVenda(venda)
    quantidade = ven.quantidade
  end

  def vendeas
    vendas = session[:vendas]
    if vendas == nil
      vendas = Array.new
    else
      vendas
    end
  end

  def limparVendas
    session[:vendas] = nil
  end

  def retornarVenda(venda)
    if  venda.class.to_s == 'Hash'
      vendeas = Venda.new(venda)
    else
      vendeas = venda
    end
  end
  def formVendas
    session[:vendas]
  end
end
