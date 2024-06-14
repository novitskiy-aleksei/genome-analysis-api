class ColorApi
  API_BASE_URL = ENV['COLOR_API_BASE_URL']

  def schedule_test(user_id, test_type, sample_type)
    url = URI("#{API_BASE_URL}/genetic_tests")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.path, { 'Content-Type' => 'application/json' })
    request.body = {
      user_id: user_id,
      test_type: test_type,
      sample_type: sample_type
    }.to_json

    response = http.request(request)
    result = JSON.parse(response.body, symbolize_names: true)

    if response.code == '201'
      {
        success: true,
        status: result[:status],
        collection_date: result[:collection_date]
      }
    else
      { success: false, error: result[:error] }
    end
  end

  def check_status(test_id)
    url = URI("#{API_BASE_URL}/genetic_tests/#{test_id}/status")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url.path)
    response = http.request(request)
    result = JSON.parse(response.body, symbolize_names: true)

    if response.code == '200'
      {
        success: true,
        status: result[:status],
        results: result[:results]
      }
    else
      { success: false, error: result[:error] }
    end
  end
end
