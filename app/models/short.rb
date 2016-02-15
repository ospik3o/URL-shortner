class Short < ActiveRecord::Base
  # attr_accessor :long, :desc
  attr_accessor :desc

  # validates :long,
  # :presence => true,
  # :format => {
  #   :with => %r{/https://z},
  #   :message => "Only HTTP links allowed!"
  # }
  def b36_id
    self.id.to_i.to_s(36)
  end

  def to_param
    if self.desc.nil?
      b36_id
    else
      "#{b36_id}/#{self.desc.parameterize}"
    end
  end


end
