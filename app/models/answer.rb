class Answer < ActiveRecord::Base

  belongs_to :option

  belongs_to :submission

end
