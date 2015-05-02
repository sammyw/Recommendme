class PlanTip < ActiveRecord::Base
  belongs_to :tip
  belongs_to :plan
end
