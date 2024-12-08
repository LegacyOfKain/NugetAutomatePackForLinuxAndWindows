## Instructions to test package directly and with nuget on linux based docker
(This is not required by Github Actions)

```shell
cd NugetAutomatePackForLinuxAndWindows
docker build -t temperature-converter-test .
docker run --rm temperature-converter-test
cd TemperatureConverter
dotnet build -c Release
dotnet pack -c Release -o ./nupkg
dotnet nuget push ./nupkg/ExampleTemperatureConverter.1.0.0.nupkg -k your-api-key -s https://api.nuget.org/v3/index.json
cd ..
docker build -t temperature-converter-usage -f Dockerfile.usage .
docker run --rm temperature-converter-usage
doskey /history
```