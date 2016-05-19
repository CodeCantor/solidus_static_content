class AddStoresToPages < ActiveRecord::Migration
  def self.up
    default_store = Spree::Store.first # takes the first store by default
    Spree::Page.find_each do |page|
      if page.stores.size.zero?
        page.stores << default_store
        page.save
      end
    end
  end

  def self.down
  end
end
