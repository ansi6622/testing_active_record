class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url
    end
  end
end
