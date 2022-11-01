# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :bigint           not null
#  code        :string
#
class Task < ApplicationRecord
  before_create :create_code
  after_commit :send_email, on: :create

  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant', dependent: :destroy
  has_many :participants, through: :participating_users, source: :user
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :participating_users, reject_if: :all_blank, allow_destroy: true
  
  validates :participating_users, presence: true

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :due_date_validity

  def due_date_validity
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, I18n.t("task.errors.due_date"))
    end
  end 

  def create_code
    self.code = "#{owner_id}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(8)}"
  end

  def send_email
    @involucrados = participants + [owner]   
    @involucrados.each do |user|   
      ParticipantMailer.with(user: user, task: self).new_task_email.deliver_now
    end
  end

end
