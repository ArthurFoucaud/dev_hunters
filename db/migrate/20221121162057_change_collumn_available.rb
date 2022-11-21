class ChangeCollumnAvailable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :devs, :available, from: nil, to: false
  end
end
