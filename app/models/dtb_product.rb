class DtbProduct < ApplicationRecord
  has_one :purchase_records
  belongs_to :user
end
