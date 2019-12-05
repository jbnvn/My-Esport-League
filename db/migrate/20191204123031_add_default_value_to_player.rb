class AddDefaultValueToPlayer < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :image_url, :string, default: 'https://cdn.pandascore.co/images/player/image/7754/kev1n-5mwq0zy1.png'
  end
end
