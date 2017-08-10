json.extract! expense, :id, :title, :amount, :note, :spent_at, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
