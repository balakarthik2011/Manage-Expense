class Expense < ApplicationRecord

  # ===================== Relations =======================
  belongs_to :user


  # ===================== Validations =======================
  validates_presence_of :title, :amount, :spent_at

end
