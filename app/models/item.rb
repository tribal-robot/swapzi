class Item < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :users_browsed, through: :browsing_histories, source: :user
  has_many :item_comments, dependent: :destroy
  has_many :item_1s, class_name: 'Swap', foreign_key: :item_1_id, dependent: :destroy
  has_many :item_2s, class_name: 'Swap', foreign_key: :item_2_id, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :swapzi_points, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
