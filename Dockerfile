#FROM mcr.microsoft.com/dotnet/sdk:8.0
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine

WORKDIR /app

# Copy the project files
COPY . ./

# Restore dependencies
RUN dotnet restore

# Build the project
RUN dotnet build --no-restore -c Release

# Run tests
CMD ["dotnet", "test", "--verbosity", "normal"]
