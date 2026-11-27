FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["Cobranca/Cobranca.csproj", "Cobranca/"]
RUN dotnet restore "Cobranca/Cobranca.csproj"

COPY . .
WORKDIR "/src/Cobranca"
RUN dotnet publish "Cobranca.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Cobranca.dll"]
