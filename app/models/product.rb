class Product < ApplicationRecord
  belongs_to :user
  has_attached_file :product_pic,
              styles: { medium: '500x500#', thumb: '100x100#' },
                    storage: :s3,
                    url: 's3_domain_url',
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_host_name: ENV["AWS_ENDPOINT"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }
          def s3_credentials
          {
          bucket: ENV["S3_BUCKET_NAME"],
          access_key_id: ENV["S3_ACCESS_KEY_ID"],
          secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
          }
  end

          validates_attachment_content_type :product_pic, content_type: /\Aimage\/.*\Z/
  end
