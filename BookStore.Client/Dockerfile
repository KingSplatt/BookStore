FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["BookStore.Client/BookStore.Client.csproj", "BookStore.Client/"]
RUN dotnet restore "BookStore.Client/BookStore.Client.csproj"
COPY . .
RUN dotnet publish "BookStore.Client/BookStore.Client.csproj" -c Release -o /app/publish

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/publish/wwwroot .
COPY nginx.conf /etc/nginx/nginx.conf