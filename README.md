# Biblioteca Descentralizada en Sui (Proyecto de Certificación)

Este proyecto implementa un sistema de préstamos de libros colateralizados (DeFi básico) en la blockchain de Sui, utilizando el lenguaje de programación Move. El contrato ha sido desplegado y probado exitosamente en la red de pruebas (Testnet) de Sui, cumpliendo con todos los requisitos para la certificación.

## Descripción del Proyecto

La Biblioteca Descentralizada es un contrato inteligente que simula el funcionamiento de una biblioteca moderna. Permite a un administrador (la biblioteca) registrar su colección de libros como activos digitales únicos (NFTs). Un usuario puede solicitar el préstamo de un libro depositando una garantía en tokens SUI.

- **Propiedad Digital:** Cada libro es un objeto `LibroNFT`, garantizando su unicidad y propiedad verificable en la blockchain.
- **Préstamos Seguros:** Al solicitar un préstamo, el usuario transfiere una garantía (tokens SUI) que queda custodiada dentro de un objeto `Prestamo`.
- **Transparencia:** Todas las operaciones, desde la creación de un libro hasta un préstamo, son transacciones públicas y verificables en la Testnet de Sui.

## ¿Cómo Usar el Contrato?

Para interactuar con el contrato en la Testnet, se necesita el [Sui CLI](https://docs.sui.io/guides/developer/getting-started/sui-install) y una dirección con tokens de prueba.

### Información del Contrato (Testnet)

- **Package ID:** `0xa5320a0732cec786d302caaafc665fef99057c9c1cf72dc4d1afc89cd76c2df9`
- **Ver en Explorador:** [Paquete en SuiVision](https://testnet.suivision.xyz/package/0xa5320a0732cec786d302caaafc665fef99057c9c1cf72dc4d1afc89cd76c2df9)

### Funciones Principales

#### 1. Crear un Nuevo Libro (`acunar_libro`)

Función de administrador para crear un `LibroNFT`.

**Comando de Ejemplo:**
```powershell
# Creando el libro "Cien Años de Soledad"
sui client call \
  --package 0xa5320a0732cec786d302caaafc665fef99057c9c1cf72dc4d1afc89cd76c2df9 \
  --module prestamos_libros \
  --function acunar_libro \
  --args 0xdb73657dadd0b2f2766de8554156265d3198c39f7e85302eafe1ac5089b0f246 0x4369656e2041c3b16f7320646520536f6c65646164 0x4761627269656c20476172636961204d61727175657a \
  --gas-budget 30000000

# Prestando el libro "Cien Años de Soledad" (ID: 0xc6bca8...) con una moneda de garantía (ID: 0x83f09b...)
sui client call \
  --package 0xa5320a0732cec786d302caaafc665fef99057c9c1cf72dc4d1afc89cd76c2df9 \
  --module prestamos_libros \
  --function prestar_libro \
  --args 0xc6bca8c1b3dc32a12f36ffa4d2ecd0b1d6ad189fa55fa0b6cf053eadfd1832d1 0x83f09ba469359be378332744b9f8dfd09f4c2925b13c0f6899c6da39b042f166 0x6 \
  --gas-budget 30000000

## Información del Contrato (MAINNET)

El contrato ha sido desplegado exitosamente en la red principal de Sui, haciéndolo una aplicación descentralizada permanente y pública.

- **Package ID:** `0xd53ddf99f9f1c41b4c98c372d11778ae1813345ceb5acb1a484a292372a71f59`
- **Ver en Explorador SuiVision:** [Enlace al Paquete en Mainnet](https://suivision.xyz/package/0xd53ddf99f9f1c41b4c98c372d11778ae1813345ceb5acb1a484a292372a71f59)
- **Ver en Explorador SuiScan:** [Enlace al Paquete en Mainnet](https://suiscan.xyz/mainnet/package/0xd53ddf99f9f1c41b4c98c372d11778ae1813345ceb5acb1a484a292372a71f59)

### Objeto de Administrador Creado

- **AdminCap ID:** `0xf575e6d7101b9f3802b5b11c183b49783527f67146b1077807822f21a1553779`
