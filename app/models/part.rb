class Part < ActiveRecord::Base
  belongs_to :being

  HEAD_CLASSES = [1, 2, 3]
  BODY_CLASSES = [1, 2, 3]
  EYES_CLASSES = [1, 2, 3]
end
