class TestSchedulerService
  PROVIDERS = {
    color: 'ColorApi',
    another: 'AnotherApi'
  }.freeze

  def initialize(user_id, test_type, sample_type, provider = :color)
    @user_id = user_id
    @test_type = test_type
    @sample_type = sample_type
    @provider = provider
  end

  def schedule_test
    provider_class = PROVIDERS[@provider.to_sym]
    if provider_class
      provider_instance = Object.const_get(provider_class).new
      provider_instance.schedule_test(@user_id, @test_type, @sample_type)
    else
      { success: false, error: 'Provider not supported' }
    end
  end

  def color_api
    @color_api ||= ColorApi
  end

  def another_api
    # ...
  end
end
