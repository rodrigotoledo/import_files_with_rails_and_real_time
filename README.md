# Import Task Project

This project is an import system for CSV data into a Rails application, where tasks are created from the CSV file and processed in the background using a job system. The project also utilizes **Turbo Streams** for real-time updates.

## Prerequisites

- Ruby (>= 3.x)
- Rails (>= 8.x)
- Redis (for background job processing)

### Installing Dependencies

1. Make sure you have all the required dependencies installed:

    ```bash
    bundle install
    ```

2. Install Redis on your system or use a Redis service. You can install it via [Redis website](https://redis.io/download) or use `brew` if you're on macOS:

    ```bash
    brew install redis
    ```

    Start Redis:

    ```bash
    redis-server
    ```

---

## Basic Commands

### 1. Prepare the Database

To set up the database, run:

```bash
rails db:prepare
```

This command will:

- Create the database (if not already created).
- Run the migrations.
- Load the seeds (if available).

### 2. Generate the CSV File

To generate a sample CSV file for testing, you can use the following rake task:

```bash
rails generate csv:import
```

This will generate a random CSV file in the tmp directory, which you can later upload through the application interface.

### 3. Start Sidekiq

For background job processing, ensure you have Redis running, and start Sidekiq to process jobs:

```bash
bundle exec sidekiq
```

Sidekiq will listen to the job queue and process background tasks, like importing data from the CSV file.

### 4. Start the Rails Server

To start the Rails server and access the application in the browser:

```bash
rails s
```

## Notes

- The project depends on Redis for job processing, so make sure Redis is installed and running before starting Sidekiq.
- Turbo Streams are used to update the task list in real time after the import is processed.
