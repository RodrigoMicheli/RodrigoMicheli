class Cliente < ApplicationRecord
  validates :nome, presence: true, length: {maximum: 50}
  validates :cpfOuCnpj, uniqueness: true, on: :validaCPF
  validaCPF = CNPJ.valid?(:cpfOuCnpj) || CPF.valid?(:cpfOuCnpj)
  validates :telefone, presence: true, length: {minimum: 11}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save do
    self.email = email.downcase
    self.cpfOuCnpj.gsub!(/(\.|\-)/, "")
    self.telefone.gsub!(/(\(|\)|\-)/, "")
  end

end
