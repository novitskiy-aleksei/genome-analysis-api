module Integrations
  class MockApi
    def schedule_test(user_id, test_type, sample_type)
      {
        success: true,
        status: 'scheduled',
        collection_date: (Date.today + 5.days).to_s
      }
    end

    def check_status(test_id)
      {
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
            date_analyzed: (Date.today - 2.days).to_s
          }
        ]
      }
    end
  end
end
