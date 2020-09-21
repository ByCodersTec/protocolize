class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.string :name

      t.timestamps
    end
  end
end
