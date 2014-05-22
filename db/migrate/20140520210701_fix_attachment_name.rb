class FixAttachmentName < ActiveRecord::Migration
  def up
  	rename_column(:documents, :add_attachment_file_name, :attachment_file_name)
  	rename_column(:documents, :add_attachment_content_type, :attachment_content_type)
   	rename_column(:documents, :add_attachment_file_size, :attachment_file_size)
  	rename_column(:documents, :add_attachment_updated_at, :attachment_updated_at)
  end

  def down
  	rename_column(:documents, :attachment_file_name, :add_attachment_file_name)
  	rename_column(:documents, :attachment_content_type, :add_attachment_content_type)
   	rename_column(:documents, :attachment_file_size, :add_attachment_file_size)
  	rename_column(:documents, :attachment_updated_at, :add_attachment_updated_at)
  end
end
