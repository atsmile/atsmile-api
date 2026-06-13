Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000", "https://portfolio.atsmile.dev"

    resource "*",
      headers: :any,
      methods: [:get, :options]
  end
end
