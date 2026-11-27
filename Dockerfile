FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia e restaura as dependências
COPY ["Cobranca.csproj", "./"]
RUN dotnet restore "Cobranca.csproj"

# Copia o restante dos arquivos e compila
COPY . .
RUN dotnet publish "Cobranca.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Cobranca.dll"]
