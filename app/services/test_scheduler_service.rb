
class TestSchedulerService

  def initialize(user_id, test_type, sample_type)
    @user_id = user_id
    @test_type = test_type
    @sample_type = sample_type
  end

  def schedule_test
    provider_class = Object.const_get("Integrations::#{ENV['SOURCE_PROVIDER']}")

    if provider_class
      provider_instance = provider_class.new
      provider_instance.schedule_test(@user_id, @test_type, @sample_type)
    else
      { success: false, error: 'Provider not supported' }
    end
  end
end
