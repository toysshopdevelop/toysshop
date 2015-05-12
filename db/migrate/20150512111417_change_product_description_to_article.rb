class ChangeProductDescriptionToArticle < ActiveRecord::Migration
  def change
    rename_column :products, :description, :article
    change_column :products, :article, :string
  end
end
