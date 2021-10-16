require 'test_helper'

class CarrinhoVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrinho_venda = carrinho_vendas(:one)
  end

  test "should get index" do
    get carrinho_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_carrinho_venda_url
    assert_response :success
  end

  test "should create carrinho_venda" do
    assert_difference('CarrinhoVenda.count') do
      post carrinho_vendas_url, params: { carrinho_venda: { : @carrinho_venda., avatar: @carrinho_venda.avatar, cliente_id: @carrinho_venda.cliente_id } }
    end

    assert_redirected_to carrinho_venda_url(CarrinhoVenda.last)
  end

  test "should show carrinho_venda" do
    get carrinho_venda_url(@carrinho_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrinho_venda_url(@carrinho_venda)
    assert_response :success
  end

  test "should update carrinho_venda" do
    patch carrinho_venda_url(@carrinho_venda), params: { carrinho_venda: { : @carrinho_venda., avatar: @carrinho_venda.avatar, cliente_id: @carrinho_venda.cliente_id } }
    assert_redirected_to carrinho_venda_url(@carrinho_venda)
  end

  test "should destroy carrinho_venda" do
    assert_difference('CarrinhoVenda.count', -1) do
      delete carrinho_venda_url(@carrinho_venda)
    end

    assert_redirected_to carrinho_vendas_url
  end
end
