class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :title, exclusion: { in: ["True Facts"] }

    validate :click_bate

    def click_bate
        unless title.match?(/Won't Believe|Secret|Top [0-9]|Guess/)
            errors.add(:title, "Must contain clickbatey element")
        end if title
    end
end
