# == Schema Information
#
# Table name: tapings
#
#  id                  :integer          not null, primary key
#  taping_date         :datetime
#  ticket_availability :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Taping do
  pending "add some examples to (or delete) #{__FILE__}"
end
