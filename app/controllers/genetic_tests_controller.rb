class GeneticTestsController < ApplicationController
  def register
    user_id = params[:user_id]
    test_type = params[:test_type]
    sample_type = params[:sample_type]
    provider = params[:provider]

    service = TestSchedulerService.new(user_id, test_type, sample_type, provider)
    response = service.schedule_test

    if response[:success]
      @genetic_test = GeneticTest.new(
        user_id: user_id,
        test_type: test_type,
        sample_type: sample_type,
        status: response[:status],
        collection_date: response[:collection_date]
      )

      if @genetic_test.save
        render json: @genetic_test, status: :created
      else
        render json: @genetic_test.errors, status: :unprocessable_entity
      end
    else
      render json: { error: response[:error] }, status: :unprocessable_entity
    end
  end
end
