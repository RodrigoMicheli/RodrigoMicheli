class Venda < ApplicationRecord
  belongs_to :cliente, optional: true
  belongs_to :produto, optional: true
  mount_uploader :avatar, AvatarUploader

  validates :quantidade, :cliente, :produto,  presence: true
  validates :avatar, file_size: { less_than: 1.megabytes }
end
