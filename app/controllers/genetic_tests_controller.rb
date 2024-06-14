class GeneticTestsController < ApplicationController
  def register
    member_id = params[:member_id]
    test_type = params[:test_type]
    sample_type = params[:sample_type]

    service = TestSchedulerService.new(member_id, test_type, sample_type)
    response = service.schedule_test

    if response[:success]
      @genetic_test = GeneticTest.new(
        member_id: member_id,
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

  def show
    member_id = params[:member_id]
    @genetic_tests = GeneticTest.where(member_id: member_id)

    if @genetic_tests.exists?
      render json: @genetic_tests, status: :ok
    else
      render json: { error: 'Results not found' }, status: :not_found
    end
  end
end
