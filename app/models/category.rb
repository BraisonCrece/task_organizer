class Category
  include Mongoid::Document
  include Mongoid::Timestamp
  has_many :tasks

  field :name, type: String
  field :description, type: String

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

end
