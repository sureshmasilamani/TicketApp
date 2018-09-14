class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :excavators do |t|
      t.hstore :Excavator
      t.references :ticket

      t.timestamps
    end
  end
end
