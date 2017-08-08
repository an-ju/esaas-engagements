class CreateMetricSamples < ActiveRecord::Migration
  def change
    create_table :metric_samples do |t|
      t.string :metric_name
      t.text :image
      t.float :score
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
