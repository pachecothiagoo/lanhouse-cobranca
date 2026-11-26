# LanHouse · Cobranca

Microsserviço de **Cobranca** do projeto LanHouse (Arquitetura de Software, Engenharia de Software, UNISATC).

Gera, paga e cancela cobranças e calcula o saldo devedor por cliente.

- Requisitos atendidos: RF07 (em conjunto com Reservas), RF08, RF11
- Depende de: nenhum serviço
- Consumido por: Reservas e Clientes
- Banco próprio: SQLite (`cobranca.db`), criado com `EnsureCreated()` na inicialização
- Porta local: `5004`

## Endpoints

- `POST /api/cobrancas`
- `GET /api/cobrancas?clienteId=&status=`
- `GET /api/cobrancas/{id}`
- `GET /api/cobrancas/cliente/{clienteId}/saldo`
- `PUT /api/cobrancas/{id}/pagar`
- `PUT /api/cobrancas/{id}/cancelar`

Também expõe `GET /health` e a documentação interativa (Scalar) em `/scalar`. Erros seguem o formato `{ "erro": "mensagem" }`.

## Configuração

Este serviço não depende de nenhum outro: não há URLs externas para configurar.

## Executar localmente

Requisito: [.NET SDK 10](https://dotnet.microsoft.com/download).

```bash
cd Cobranca
dotnet run --launch-profile http   # http://localhost:5004
```

## Executar com Docker

```bash
docker build -t lanhouse-cobranca .
docker run --rm -p 5004:8080 lanhouse-cobranca
```

## Publicação no Render

| Campo | Valor |
|---|---|
| Language | Docker |
| Dockerfile Path | `./Dockerfile` |
| Docker Build Context Directory | `./` |
| Instance Type | Free |

Publique primeiro os serviços sem dependências (Cobrança e Computadores), depois Clientes e por último Reservas.

## Os 4 repositórios do projeto

| Serviço | Repositório |
|---|---|
| Clientes | https://github.com/pachecothiagoo/lanhouse-clientes |
| Computadores | https://github.com/pachecothiagoo/lanhouse-computadores |
| Reservas | https://github.com/pachecothiagoo/lanhouse-reservas |
| Cobrança | https://github.com/pachecothiagoo/lanhouse-cobranca |

Documento de requisitos, diagramas e execução conjunta: https://github.com/pachecothiagoo/lanhouse
