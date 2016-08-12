class User < ActiveRecord::Base

  has_secure_password

  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"

  has_many :parents, class_name: "User", foreign_key: "student_id"
  has_many :students, class_name: "User", foreign_key: "teacher_id"
  has_many :homeworks
  has_many :comments, through: :homeworks
  has_many :tasks, through: :homeworks

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end