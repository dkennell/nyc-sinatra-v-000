class Title < ActiveRecord::Base
    has_many :figure_titles
    has_many :figures, :through => :figure_titles
    has_many :landmarks, :through => :figures
    
    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        Title.all.find{ |figure| figure.slug == slug}
    end
end