class User < ActiveRecord::Base

  has_secure_password

  belongs_to :teacher, class_name: "User"

  has_many :students, class_name: "User", foreign_key: "teacher_id"
  has_many :homeworks
  has_many :comments, through: :homeworks
  has_many :tasks, through: :homeworks

  validates :name, presence: true
  validates :username, presence: true
end