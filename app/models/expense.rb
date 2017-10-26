class Expense < ApplicationRecord

  # ===================== Relations =======================
  belongs_to :user


  # ===================== Validations =======================
  validates_presence_of :spent_for, :amount, :spent_at

end
