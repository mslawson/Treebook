class Document < ActiveRecord::Base
  attr_accessible :attachment, :remove_attachment
  has_attached_file :attachment

  attr_accessor :remove_attachment

  before_save :perform_attachment_removal

  def perform_attachment_removal
  	if remove_attachment == '1' && !attachment.dirty?
  		self.attachment = nil
  	end
  end


  do_not_validate_attachment_file_type :attachment
end
