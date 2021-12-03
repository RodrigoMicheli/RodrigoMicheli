class Venda < ApplicationRecord
  belongs_to  :produto, optional: true
  belongs_to  :carrinho_venda, optional: true

  validates :quantidade, :produto, :carrinho_venda,  presence: true
end
