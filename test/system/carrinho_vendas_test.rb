require "application_system_test_case"

class CarrinhoVendasTest < ApplicationSystemTestCase
  setup do
    @carrinho_venda = carrinho_vendas(:one)
  end

  test "visiting the index" do
    visit carrinho_vendas_url
    assert_selector "h1", text: "Carrinho Vendas"
  end

  test "creating a Carrinho venda" do
    visit carrinho_vendas_url
    click_on "New Carrinho Venda"

    fill_in "", with: @carrinho_venda.
    fill_in "Avatar", with: @carrinho_venda.avatar
    fill_in "Cliente", with: @carrinho_venda.cliente_id
    click_on "Create Carrinho venda"

    assert_text "Carrinho venda was successfully created"
    click_on "Back"
  end

  test "updating a Carrinho venda" do
    visit carrinho_vendas_url
    click_on "Edit", match: :first

    fill_in "", with: @carrinho_venda.
    fill_in "Avatar", with: @carrinho_venda.avatar
    fill_in "Cliente", with: @carrinho_venda.cliente_id
    click_on "Update Carrinho venda"

    assert_text "Carrinho venda was successfully updated"
    click_on "Back"
  end

  test "destroying a Carrinho venda" do
    visit carrinho_vendas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carrinho venda was successfully destroyed"
  end
end
