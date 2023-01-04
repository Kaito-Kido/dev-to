class React < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true, counter_cache: true
end
