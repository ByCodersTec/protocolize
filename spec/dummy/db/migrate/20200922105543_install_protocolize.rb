class InstallProtocolize < ActiveRecord::Migration[6.0]
  def self.up
    create_table :protocols do |t|
      t.string    :origin_class
      t.integer   :origin_object
      t.string    :origin_project

      t.string    :random
      t.string    :protocol
      t.datetime  :created_at
    end

    add_index :protocols, :protocol
  end

  def self.down
    drop_table :protocols
  end
end

