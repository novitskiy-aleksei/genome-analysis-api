# Genome Analysis API

![Heroku Deploy](https://deploy-badge.vercel.app/heroku/genomic-test-app-df555927721d?root=genetic_tests%2F1%2Fresults&style=for-the-badge)

This is a Ruby on Rails application that provides a genetic test API with background job processing using Delayed Job. The application supports registration for genetic tests and retrieval of test results.

## Features

- Register a genetic test for a member
- Retrieve genetic test results
- Background job processing with Delayed Job

### Endpoints

#### Register a Genetic Test

- **URL**: `/genetic_tests/register`
- **Method**: `POST`
- **Request Body**:
    ```json
    {
      "member_id": "1",
      "test_type": "exome",
      "sample_type": "saliva"
    }
    ```
- **Description**: This endpoint registers a new genetic test for a member. The request body must include the `member_id`, `test_type`, `sample_type`, and optionally a `provider`.

#### Get Genetic Test Results

- **URL**: `/genetic_tests/:member_id/results`
- **Method**: `GET`
- **Description**: This endpoint retrieves the genetic test results for a specified member. Replace `:member_id` with the actual member ID to get the results.

## Requirements

- Ruby 3.x
- Rails 6.x
- MySQL (JawsDB on Heroku)
- Delayed Job for background processing

## Setup

### Local Development

1. Clone the repository:

    ```bash
    git clone https://github.com/novitskiy-aleksei/genome-analysis-api.git
    cd genome-analysis-api
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Start the Rails server:

    ```bash
    rails server
    ```

5. Start Delayed Job:

    ```bash
    sidekiq -C config/sidekiq.yml
    ```

### Environment Variables

Create a `.env` file in the root directory to set up environment variables:

```env
JAWSDB_URL=mysql_url
REDISCLOUD_URL=redis_url