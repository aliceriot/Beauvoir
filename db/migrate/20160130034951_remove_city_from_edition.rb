class RemoveCityFromEdition < ActiveRecord::Migration[5.0]
  def change
    remove_column :editions, :city
  end
end
