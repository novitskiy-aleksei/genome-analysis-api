class CheckStatusWorker
  include Sidekiq::Worker

  def perform
    GeneticTest.where(status: 'pending').find_each do |genetic_test|
      response = ColorApi.check_status(genetic_test.id)

      if response[:success]
        genetic_test.update(
          status: response[:status],
          results: response[:results] || genetic_test.results
        )
      end
    end
  end
end
