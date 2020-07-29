class Movie < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :country
    belongs_to :site
    belongs_to :user
    has_many :reviews
    has_many :tags
    
    

    scope :search, -> (search_params) do
        return if search_params.blank?

          country_id_is(search_params[:country_id])
          site_id_is(search_params[:site_id])
    end
    scope :country_id_is, -> (country_id) { where(country_id: country_id) if country_id.present? }
    scope :site_id_is, -> (site_id) { where(site_id: site_id) if site_id.present? }
end

