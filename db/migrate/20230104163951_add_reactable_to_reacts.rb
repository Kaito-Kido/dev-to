class AddReactableToReacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :reacts, :reactable, polymorphic: true, null: false
  end
end
