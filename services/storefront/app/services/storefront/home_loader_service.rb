module Storefront
  class HomeLoaderService
    QUANTITY_OF_RECORDS_PER_GROUP = 4
    MIN_RELEASE_DAYS = 7
    att_reader :featured, :last_releases, :cheapest

    def initialize
      @featured = []
      @last_releases = []
      @cheapest = []
    end

    def call
      games = Product.join("JOIN games ON productable_type = 'Game' AND productable_id = games.id ")
      .includes(productable: [:games]).where(status: :available)
    end
  end
end