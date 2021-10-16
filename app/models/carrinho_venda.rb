class CarrinhoVenda < ApplicationRecord
  belongs_to  :cliente, optional: true
  has_many :venda

  validates :avatar, file_size: { less_than: 1.megabytes }
  mount_uploader :avatar, AvatarUploader

  validates :cliente, :venda,  presence: true
end
