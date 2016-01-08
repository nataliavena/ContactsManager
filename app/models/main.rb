class Main < ActiveRecord::Base
  extend Dragonfly::Model
  include Avatarable

  dragonfly_accessor :image

  belongs_to :user

  validates :first_name, :last_name, :email, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def avatar_text
    first_name.chr
  end

end
