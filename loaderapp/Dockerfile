FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY . .

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0-alpine
WORKDIR /app
COPY --from=build /app/out .

CMD ["dotnet", "acme-loader.dll", "<file-name>", "<integer-1>", "<integer-2>"]