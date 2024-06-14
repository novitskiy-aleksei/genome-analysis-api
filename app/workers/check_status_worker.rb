class CheckStatusWorker
  include Sidekiq::Worker

  def perform
    GeneticTest.where(status: 'scheduled').find_each do |genetic_test|
      response = api.check_status(genetic_test.id)

      if response[:success]
        genetic_test.update(
          status: response[:status],
          results: response[:results] || genetic_test.results
        )
      end
    end
  end

  def api
    @api ||= Object.const_get("Integrations::#{ENV['SOURCE_PROVIDER']}").new
  end
end
