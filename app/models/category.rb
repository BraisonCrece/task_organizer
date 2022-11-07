class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :tasks

  field :name, type: String
  field :description, type: String

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

end
