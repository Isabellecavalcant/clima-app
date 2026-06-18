# Clima Mundial

Aplicativo desenvolvido em Flutter para consulta de condições climáticas em tempo real utilizando a API Open-Meteo.

## Funcionalidades

* Pesquisa dinâmica de cidades
* Consulta de temperatura e condições climáticas em tempo real
* Busca de novas cidades através da API Open-Meteo
* Sistema de cidades favoritas
* Filtro de favoritos por cidade ou país
* Exibição de informações detalhadas da cidade:

  * Temperatura atual
  * Condição climática
  * País
  * Estado/Região
  * Latitude e Longitude
* Navegação entre telas utilizando GetX
* Tratamento de resultados duplicados em pesquisas

## Tecnologias Utilizadas

* Flutter
* Dart
* GetX
* Open-Meteo API

## Estrutura do Projeto

```text
lib/
├── controllers/
│   └── weather_controller.dart
├── models/
│   └── city.dart
├── screens/
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── favorites_screen.dart
│   └── detail_screen.dart
├── services/
│   └── weather_service.dart
└── main.dart
```

## Como Executar

1. Clone o repositório:

```bash
git clone <url-do-repositorio>
```

2. Acesse a pasta do projeto:

```bash
cd clima_app
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o aplicativo:

```bash
flutter run
```

## API Utilizada

O projeto utiliza a API Open-Meteo para:

* Geolocalização de cidades
* Consulta de temperatura atual
* Consulta de condições climáticas

Documentação oficial:

https://open-meteo.com/

## Autor

Isabelle Cavalcanti da Silva

Projeto desenvolvido para fins acadêmicos na disciplina de Programação Orientada a Objetos.

**Ano:** 2026
