class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :tickets do |t|
       t.integer :RequestNumber
       t.integer :SequenceNumber
       t.string :RequestType
       t.hstore :DateTimes
       t.hstore :ServiceArea
       t.hstore :DigsiteInfo

      t.timestamps
    end
  end
end
