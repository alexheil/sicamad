class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope -> { order('id DESC') }

  belongs_to :category

  before_save :should_generate_new_friendly_id?, if: :slug_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
