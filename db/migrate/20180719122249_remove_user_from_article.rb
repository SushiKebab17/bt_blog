class RemoveUserFromArticle < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :user, :string
  end
end
