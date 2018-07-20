class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 3 }

  def text_shown
    max_chars_shown = 65
    if text.length > max_chars_shown
      return text[0..max_chars_shown-1] + '...'
    else
      return text
    end
  end
end
