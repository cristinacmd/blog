class Article < ApplicationRecord
    has_rich_text :content #texto enriquecido
    belongs_to :user # campo adicional
end
