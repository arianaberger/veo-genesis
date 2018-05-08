class Part < ActiveRecord::Base
  belongs_to :being

  TYPES = ['head', 'body', 'eyes']

  HEAD_MODELS = [1, 2, 3]
  BODY_MODELS = [1, 2, 3]
  EYES_MODELS = [1, 2, 3]
end
