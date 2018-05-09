class Part < ActiveRecord::Base
  belongs_to :being

  HEAD, BODY, EYES = 0, 1, 2

  HEAD_MODELS = [1, 2, 3, 4]
  BODY_MODELS = [1, 2, 3, 4]
  EYES_MODELS = [1, 2, 3, 4]
end
