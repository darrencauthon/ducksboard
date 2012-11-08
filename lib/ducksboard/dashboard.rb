module Ducksboard
  class Dashboard
    include HTTParty
    include API
    format :json
    type "app"

    attr_accessor :background, :layout, :name, :slug

    # Get all dashboards.
    # 
    # Returns a list of dashboard instances.
    def self.all
      response = self.get("/dashboards", :basic_auth => Ducksboard.auth)
      response['data'].map {|attrs| new(attrs) }
    end

    # Find a dashboard by slug.
    #
    # slug - A string identifying the dashboard.
    #
    # Returns an instance of Dashboard.
    def self.find(slug)
      response = self.get("/dashboards/#{slug}", :basic_auth => Ducksboard.auth)
      new(response)
    end

    # POST   /dashboards/
    # def self.create
    # end

    # Initialize an instance by attributes.
    #
    # attrs - A hash of dashboard attributes.
    def initialize(attrs={})
      @background = attrs['background']
      @layout = attrs['layout']
      @name = attrs['name']
      @slug = attrs['slug']
    end

    # PUT    /dashboards/:slug
    # def save
    # end

    # DELETE /dashboards/:slug
    # def destroy
    # end

    # POST   /dashboard/:slug/accessed
    # def accessed
    # end
  end
end
