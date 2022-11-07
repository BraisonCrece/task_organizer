class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :due_date, type: Date
  field :code, type: String

  
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  # has_many :participants, through: :participating_users, source: :user
  has_many :notes
  
  
  validates :participating_users, presence: true
  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :due_date_validity
  
  before_create :create_code
  after_save :send_email, if: :create
  
  accepts_nested_attributes_for :participating_users, reject_if: :all_blank, allow_destroy: true

  def participants
    participating_users.includes(:user).map(&:user)
  end

  def due_date_validity
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, I18n.t("task.errors.due_date"))
    end
  end 

  def create_code
    self.code = "#{owner_id}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(8)}"
  end

  def send_email
    return
    @involucrados = participants + [owner]   
    @involucrados.each do |user|   
      ParticipantMailer.with(user: user, task: self).new_task_email.deliver_now
    end
  end

end
