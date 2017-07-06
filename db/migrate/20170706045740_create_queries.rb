class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.integer :q_id
      t.string :content_query
      t.string :context_query

      t.timestamps
    end
  end
end
