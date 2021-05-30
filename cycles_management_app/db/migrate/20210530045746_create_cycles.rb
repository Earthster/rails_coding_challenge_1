class CreateCycles < ActiveRecord::Migration[6.1]
  def change
    create_table :cycles do |t|
      t.string :name
      t.jsonb :components, default: '[]'

      t.timestamps
    end
  end
end
