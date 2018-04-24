# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  f_name          :string
#  l_name          :string
#  motto           :string
#  receive_emails  :boolean          default(FALSE)
#  current_points  :integer          default(0)
#  access_type     :string           default("user")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
