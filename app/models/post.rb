class Post < ApplicationRecord
    validates :title, presence: :true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: 'Fiction'..'Non-fiction'}
    validate :allow_value

    def allow_value
        unless title.include("Won't Believe"||"Secret"||"Top 5"||"Guess")
            render json: { errors: title.errors.full_messages }, status: :unprocessable_entity
    end

end
