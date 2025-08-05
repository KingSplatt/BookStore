# Multi-stage build for API only
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["BookStore.Api/BookStore.Api.csproj", "BookStore.Api/"]
RUN dotnet restore "BookStore.Api/BookStore.Api.csproj"
COPY BookStore.Api/ BookStore.Api/
RUN dotnet publish "BookStore.Api/BookStore.Api.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "BookStore.Api.dll"]
