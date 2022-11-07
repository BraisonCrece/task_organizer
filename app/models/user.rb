class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  field :remember_created_at, type: Time

  has_many :owned_tasks, class_name: 'Task'
  has_many :participations, class_name: 'Participant'
  # has_many :tasks, through: :participations

  def tasks
    participations.includes(:task).map(&:task)
  end
end
