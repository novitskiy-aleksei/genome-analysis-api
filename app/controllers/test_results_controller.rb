class TestResultsController < ApplicationController
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
