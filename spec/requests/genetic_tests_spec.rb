require 'rails_helper'
require 'color_api'

RSpec.describe "GeneticTests", type: :request do
  let(:member_id) { 1 }

  before do
    allow_any_instance_of(ColorApi).to receive(:schedule_test).and_return({
                                                                            success: true,
                                                                            status: 'scheduled',
                                                                            collection_date: '2024-06-15'
                                                                          })

    allow_any_instance_of(ColorApi).to receive(:check_status).and_return({
                                                                           success: true,
                                                                           status: 'completed',
                                                                           results: [
                                                                             {
                                                                               gene: 'BRCA1',
                                                                               variant: 'c.5266dupC',
                                                                               clinical_significance: 'pathogenic',
                                                                               zygosity: 'heterozygous',
                                                                               associated_conditions: ['Breast cancer', 'Ovarian cancer'],
                                                                               recommendations: 'Consult with a genetic counselor.',
                                                                               date_analyzed: '2024-06-20'
                                                                             }
                                                                           ]
                                                                         })
  end

  describe "POST /genetic_tests/register" do
    it "registers a new genetic test" do
      post "/genetic_tests/register", params: {
        member_id: member_id,
        test_type: "exome",
        sample_type: "saliva",
        provider: "color"
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["member_id"]).to eq(member_id)
    end
  end

  describe "GET /genetic_tests/:member_id/results" do
    let!(:genetic_test) { create(:genetic_test, member_id: member_id, status: "completed") }
    let!(:test_result) { create(:test_result, genetic_test: genetic_test) }

    it "retrieves the results of a genetic test" do
      get "/genetic_tests/#{member_id}/results"

      expect(response).to have_http_status(:ok)
      results = JSON.parse(response.body)
      expect(results).not_to be_empty
      expect(results.first["id"]).to eq(genetic_test.id)
    end
  end
end
