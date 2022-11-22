class ChangeColumnStatusSeller < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status_seller, from: nil, to: 'pending'
  end
end
