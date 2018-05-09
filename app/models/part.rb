class Part < ActiveRecord::Base
  belongs_to :being

  HEAD_MODELS = [1, 2, 3, 4]
  BODY_MODELS = [1, 2, 3, 4]
  EYES_MODELS = [1, 2, 3, 4]
end
