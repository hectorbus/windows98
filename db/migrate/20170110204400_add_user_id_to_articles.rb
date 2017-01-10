class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :publisher, :string
    add_reference :articles, :user, foreign_key: true
  end
end
