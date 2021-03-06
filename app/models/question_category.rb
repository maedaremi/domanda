class QuestionCategory < ApplicationRecord
    validates :question_id, presence: true
    validates :category_id, presence: true
    
    belongs_to :category
    belongs_to :question
end
