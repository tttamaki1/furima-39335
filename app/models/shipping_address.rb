class ShippingAddress < ApplicationRecord
    has_one :purchase_history
end
