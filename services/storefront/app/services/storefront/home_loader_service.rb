module Storefront
  class HomeLoaderService
    QUANTITY_OF_RECORDS_PER_GROUP = 4
    MIN_RELEASE_DAYS = 7
    attr_reader :featured, :last_releases, :cheapest

    def initialize
      @featured = []
      @last_releases = []
      @cheapest = []
    end

    def call
      games = Product.joins("INNER JOIN games ON games.id = products.productable_id AND products.productable_type = 'Game'")
                     .where(status: :available)
      @featured = load_featured_games(games)
      @last_releases = load_last_released_games(games)
      @cheapest = load_cheapest_games(games)
    end

    private

    def load_featured_games(games)
      games.where(products: { featured: true }).sample(QUANTITY_OF_RECORDS_PER_GROUP)
    end

    def load_last_released_games(games)
      games.where(games: { release_date: MIN_RELEASE_DAYS.days.ago.beginning_of_day..Time.now.end_of_day })
           .sample(QUANTITY_OF_RECORDS_PER_GROUP)
    end

    def load_cheapest_games(games)
      games.order("products.price ASC").limit(QUANTITY_OF_RECORDS_PER_GROUP)
    end
  end
end