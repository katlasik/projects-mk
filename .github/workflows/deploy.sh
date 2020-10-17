name: Deploy Branch

on:
  workflow_dispatch

jobs:

  test:
    name: Deploy
    runs-on: ubuntu-18.04

    steps:
      - uses: actions/checkout@v1
      - name: Set up JDK 11
        uses: actions/setup-java@v1
        with:
          java-version: 1.11
      - name: Maven Package
        run: mvn -B clean package
      - uses: akhileshns/heroku-deploy@master
        with:
          heroku_api_key: ${{secrets.HEROKU_API_KEY}}
          heroku_app_name: "katlasik-auctions"
          heroku_email: "krzysztof.atlasik@pm.me"
