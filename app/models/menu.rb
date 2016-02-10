class Menu < ActiveRecord::Base
  has_many :menu_items

  accepts_nested_attributes_for :menu_items, reject_if: :all_blank #new method menu_items_attributes=(attributes) is added to model
end
