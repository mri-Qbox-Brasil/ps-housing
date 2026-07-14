# ps-housing — Manual

Sistema de habitação para QBCore/Qbox: propriedades e apartamentos com shells ou MLO, chaves compartilhadas, mobília posicionável, baú, guarda-roupa, garagem e invasão policial.

---

## Sumário

1. [Dependências](#dependências)
2. [Instalação](#instalação)
3. [Configuração](#configuração)
4. [Apartamentos](#apartamentos)
5. [Shells](#shells)
6. [Mobília](#mobília)
7. [Propriedades: entrada, chaves e menus](#propriedades-entrada-chaves-e-menus)
8. [Invasão policial](#invasão-policial)
9. [Comandos](#comandos)
10. [Banco de dados](#banco-de-dados)
11. [Integrações](#integrações)
12. [Entrypoints para outros recursos](#entrypoints-para-outros-recursos)
13. [Estrutura de arquivos](#estrutura-de-arquivos)

---

## Dependências

| Recurso | Obrigatório | Observação |
|---|---|---|
| `qb-core` | Sim | O código chama `exports['qb-core']:GetCoreObject()` direto, mesmo no modo Qbox |
| `ox_lib` | Sim | Callbacks, diálogos, radial menu, cache |
| `oxmysql` | Sim | Persistência |
| `fivem-freecam` | Sim | Câmera livre do posicionador de mobília. Declarado em `dependency` no `fxmanifest.lua` |
| `ox_doorlock` **ou** `qb-doorlock` | Sim | O `server/server.lua` aborta com erro se nenhum dos dois estiver iniciado |
| `ps-realtor` | Sim, na prática | É quem cadastra propriedades (chama `exports['ps-housing']:registerProperty`) |
| `ox_target` ou `qb-target` | Sim | Definido em `Config.Target` |
| `ox_inventory` ou `qb-inventory` | Sim | Definido em `Config.Inventory` |
| `qbx_garages` | Não | Se iniciado, a garagem da propriedade é registrada por ele; senão, cai no `qb-garages` |
| `qb-radialmenu` | Não | Só se `Config.Radial = "qb"`. Com `"ox"`, usa o radial do `ox_lib` |
| `qb-clothing` | Não | Abre o menu de roupas no guarda-roupa e cria o personagem no primeiro apartamento |
| `qb-banking` | Não | Só se `Config.QBManagement = true` |
| `qb-log` | Não | Só se `Config.EnableLogs = true` e `Config.Logs = "qb"` |

---

## Instalação

1. Copie a pasta `ps-housing` para `resources/`.
2. Importe o SQL. Escolha o arquivo conforme o framework:
   - QBCore — `README - INSTALL INSTRUCTIONS/QBCore/properties.sql`
   - Qbox — `README - INSTALL INSTRUCTIONS/QBOX/properties.sql`

   Os dois fazem `DROP TABLE IF EXISTS properties` antes de criar. O `server/db.lua` também tenta criar a tabela sozinho no start, mas rodar o SQL é o caminho recomendado — ele existe justamente para resolver o conflito com a `properties_decorations` do `qbx_properties`.
3. Aplique os patches nos outros recursos. Eles **não** são opcionais:
   - Qbox — ver `README - INSTALL INSTRUCTIONS/QBOX/README.md`. Edita `qbx_core/client/character.lua`, `qbx_core/config/server.lua`, `qbx_spawn`, `qbx_properties` e o `ox_doorlock` (que precisa de um evento `ox_doorlock:RemoveDoorlock`).
   - QBCore — ver `README - INSTALL INSTRUCTIONS/QBCore/README.md` e o `qb-doorlock/server/main.lua` do mesmo diretório.
4. Adicione ao `server.cfg`, garantindo que o doorlock sobe **antes**:
   ```
   ensure ox_lib
   ensure ox_doorlock
   ensure fivem-freecam
   ensure ps-realtor
   ensure ps-housing
   ```
5. Ajuste `shared/config.lua` — no mínimo `Config.Target`, `Config.Inventory`, `Config.PoliceJobNames` e `Config.RealtorJobNames`.

> **Conflito**: substitui o `qb-houses` e o `qb-apartments`. Não rode os três juntos. Os comandos `/migratehouses` e `/migrateapartments` existem para trazer os dados antigos.

---

## Configuração

Arquivo: `shared/config.lua`.

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `Config.Target` | `"ox"` / `"qb"` | Sim | Sistema de target usado nas entradas e nos móveis |
| `Config.Notify` | `"ox"` / `"qb"` | Sim | Sistema de notificação |
| `Config.Radial` | `"ox"` / `"qb"` | Sim | Menu radial dentro da propriedade |
| `Config.Inventory` | `"ox"` / `"qb"` | Sim | Como o baú é aberto. Nos dois casos, os stashes são registrados no `ox_inventory` |
| `Config.Logs` | `"qb"` | Não | Único valor implementado. Com `"ox"`, o log é um noop |
| `Config.AccessCanEditFurniture` | bool | Sim | `true` deixa quem tem a chave (não só o dono) mobiliar a casa |
| `Config.DebugMode` | bool | Não | Desenha as zonas de target e liga a função `Debug()` |
| `Config.EnableLogs` | bool | Sim | Liga o envio de logs |
| `Config.DynamicDoors` | bool | Sim | Cria as portas no doorlock dinamicamente por propriedade |
| `Config.PoliceJobNames` | array | Sim | Jobs que podem invadir propriedades |
| `Config.MinGradeToRaid` | number | Sim | Nível mínimo do job policial para invadir |
| `Config.RaidTimer` | number (min) | Sim | Tempo que a propriedade fica marcada como "em invasão". Uma nova invasão só pode começar depois disso |
| `Config.RaidItem` | string | Sim | Item necessário para invadir. Padrão: `police_stormram` |
| `Config.ConsumeRaidItem` | bool | Sim | Consome o item na invasão. Com `ox_inventory`, prefira `consume` no `data/items.lua` e deixe isso `false` |
| `Config.RealtorJobNames` | array | Sim | Jobs que podem vender e apresentar imóveis |
| `Config.QBManagement` | bool | Sim | `true` deposita o valor da venda na conta da imobiliária via `qb-banking` |
| `Config.Commissions` | tabela | Sim | Comissão do corretor por nível do job (`[grade] = fração`). O resto vai para o dono, se houver |
| `Config.StartingApartment` | bool | Sim | `false` não dá apartamento inicial ao personagem novo |
| `Config.ShowCustomizerWhenNoStartingApartment` | bool | Sim | Abre o customizador de personagem quando não há apartamento inicial |
| `Config.Apartments` | tabela | Sim | Prédios de apartamento — ver seção abaixo |
| `Config.Shells` | tabela | Sim | Catálogo de shells — ver seção abaixo |
| `Config.FurnitureTypes` | tabela | Sim | Comportamento especial de móveis (`storage` e `clothing`) |
| `Config.Furnitures` | tabela | Sim | Catálogo de móveis por categoria |

Todas as permissões (invadir, apresentar, ver informações) exigem que o jogador esteja **em serviço** (`onduty`), com uma exceção: a opção "Conhecer" na bridge do `ox_target` só checa o job, não o serviço.

---

## Apartamentos

Cada entrada de `Config.Apartments` é um prédio, com uma porta única que dá acesso aos apartamentos individuais de quem mora lá.

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `label` | string | Sim | Nome exibido |
| `door` | `{x,y,z,h,length,width}` | Sim | Zona de target da entrada do prédio |
| `imgs` | array | Sim | Imagens exibidas na UI (`url` e `label`) |
| `shell` | string | Sim | Chave em `Config.Shells` usada no interior de cada apartamento |
| `interior` | vector3 | Não | Só para apartamentos MLO/IPL — coordenada do interior |
| `thickness` | number | Não | Só para MLO |
| `zone` | array de vector3 | Não | Só para MLO — polígono do interior |

Os prédios que já vêm configurados: Integrity Way, South Rockford Drive, Morningwood Blvd, Tinsel Towers, Fantastic Plaza e Modern 1 Apartment (este último é MLO).

Um personagem só pode ter **um** apartamento — a restrição é imposta pelo banco (`UNIQUE (owner_citizenid, apartment)`).

---

## Shells

Um shell é o interior que a propriedade usa. `Config.Shells` define:

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `label` | string | Sim | Nome exibido |
| `hash` | string | Sim, exceto no `mlo` | Nome do modelo do shell. A entrada `"mlo"` não tem `hash` — ela indica que a propriedade usa um interior MLO real |
| `doorOffset` | `{x,y,z,h,width}` | Sim | Onde fica a porta de saída dentro do shell |
| `stash` | `{maxweight, slots}` | Sim | Configuração do baú registrado no `ox_inventory` |
| `imgs` | array | Sim | Imagens exibidas na UI |

Os shells que vêm no config incluem motel, hotel, apartamentos, garagem, escritório, loja, galpão, contêiner, casas, trailer e um conjunto em português (`Casa Média`, `Mansão`, `Quitinete`, `Trailer 01`), todos apontando para models `gg_shell_*`.

**Os models dos shells não vêm no recurso.** Você precisa ter os `.ytyp`/props correspondentes em algum resource de stream, senão a propriedade não carrega.

---

## Mobília

O menu "Mobiliar Casa" (radial, dentro da propriedade) abre o posicionador: uma UI Svelte com câmera livre (`fivem-freecam`) onde o jogador compra e posiciona props. O layout é salvo na coluna `furnitures` da tabela `properties`.

O catálogo fica em `Config.Furnitures`, agrupado por categoria:

```lua
{
    category = "Pré-requisitos",
    items = {
        { object = "v_res_tre_storagebox", price = 100, label = "Baú",           type = "storage",  max = 2 },
        { object = "v_res_tre_wardrobe",   price = 100, label = "Guarda-Roupas", type = "clothing", max = 2 },
    }
},
```

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `object` | string | Sim | Model do prop |
| `price` | number | Sim | Preço de compra |
| `label` | string | Sim | Nome exibido |
| `type` | string | Não | `"storage"` ou `"clothing"`. Sem isso, o móvel é apenas decorativo |
| `max` | number | Não | Quantos daquele móvel a propriedade pode ter |

Os dois `type` implementados estão em `Config.FurnitureTypes`:

- `storage` — o móvel vira um baú com third-eye. O stash é `property_<property_id>` e usa a config `stash` do shell.
- `clothing` — o móvel vira um guarda-roupa que abre o `qb-clothing:client:openOutfitMenu`.

Quem pode mobiliar: o dono sempre; quem tem a chave, só se `Config.AccessCanEditFurniture = true`.

---

## Propriedades: entrada, chaves e menus

Na porta de uma propriedade, o third-eye mostra opções diferentes conforme quem você é:

| Opção | Quem vê |
|---|---|
| Entrar | Dono ou quem tem a chave |
| Tocar campainha | Quem **não** tem acesso. Notifica quem está dentro, que decide se abre |
| Conhecer | Corretor (job em `RealtorJobNames`) |
| Informações do imóvel | Corretor em serviço |
| Invadir | Polícia em serviço, com nível ≥ `Config.MinGradeToRaid` |

Dentro da propriedade, na zona da porta: "Sair" e "Campainha".

O menu radial dentro da propriedade tem:

| Opção | Quem vê |
|---|---|
| Mobiliar Casa | Dono, ou quem tem a chave se `AccessCanEditFurniture` |
| Chaves da Casa | Só o dono |

"Chaves da Casa" abre o gerenciamento de acesso: adicionar um jogador próximo à lista de quem pode entrar, e remover quem já está. A lista fica na coluna `has_access` (array de `citizenid`) e é sincronizada com o doorlock — quem tem a chave é adicionado aos `characters` da porta.

---

## Invasão policial

O policial com job em `Config.PoliceJobNames`, em serviço, com nível ≥ `Config.MinGradeToRaid` e portando o `Config.RaidItem`, pode invadir uma propriedade. Após a confirmação, ele entra direto e quem está dentro é notificado.

A propriedade fica marcada como "em invasão" por `Config.RaidTimer` minutos — nesse período outra invasão não pode ser iniciada. Em propriedades MLO, as portas são destrancadas no doorlock no momento da invasão (e não voltam a trancar sozinhas quando o timer expira).

Se `Config.ConsumeRaidItem = true`, o item é consumido. Com `ox_inventory`, o recomendado é deixar isso `false` e usar a propriedade `consume` na definição do item.

Apartamentos também podem ser invadidos, pela opção "Invadir apartamento" na entrada do prédio — o policial escolhe qual apartamento na lista.

---

## Comandos

| Comando | Permissão | Descrição |
|---|---|---|
| `/migratehouses` | Todos (client) | Migra as casas do `qb-houses` para a tabela `properties`. Rode uma vez e remova |
| `/migrateapartments` | Todos (servidor) | Migra os apartamentos do `qb-apartments`. Rode uma vez e remova |

Nenhum dos dois é protegido por ACE ou por permissão. Use com o servidor fechado e desabilite depois.

---

## Banco de dados

Tabela `properties`:

| Coluna | Tipo | Descrição |
|---|---|---|
| `property_id` | int AUTO_INCREMENT | Chave primária |
| `owner_citizenid` | varchar(50) | Dono. FK para `players.citizenid`, com `ON DELETE CASCADE` |
| `street` | varchar(100) | Rua |
| `region` | varchar(100) | Região |
| `description` | longtext | Descrição exibida na UI |
| `has_access` | JSON | Array de `citizenid` que têm a chave |
| `extra_imgs` | JSON | Imagens adicionais do anúncio |
| `furnitures` | JSON | Móveis posicionados |
| `for_sale` | boolean | Se está anunciada. Padrão: `1` |
| `price` | int | Preço |
| `shell` | varchar(50) | Chave em `Config.Shells` |
| `apartment` | varchar(50) | Chave em `Config.Apartments`. `NULL` significa que é uma casa |
| `door_data` | JSON | `{x, y, z, h, length, width}` da porta |
| `garage_data` | JSON | `{x, y, z}` da garagem. `NULL` se não tem |
| `zone_data` | JSON | Polígono do interior (MLO) |

Restrição `UNIQUE (owner_citizenid, apartment)` — um personagem só pode ter um apartamento.

---

## Integrações

### ps-realtor

É o corretor: cadastra propriedades chamando `exports['ps-housing']:registerProperty(data)` (ou o evento `ps-housing:server:registerProperty`). Sem ele, não há como criar imóveis sem escrever código.

### ox_doorlock / qb-doorlock

Um dos dois é **obrigatório** — o recurso aborta no start sem eles. As portas das propriedades MLO são criadas com o nome `ps_mloproperty<property_id>_<indice>`. A lista de `characters` da porta é atualizada sempre que alguém ganha ou perde a chave.

O `ox_doorlock` precisa do patch descrito no README de instalação, que adiciona o evento `ox_doorlock:RemoveDoorlock` (usado ao deletar a propriedade).

### qbx_garages / qb-garages

Se `qbx_garages` estiver iniciado, a garagem é registrada pelo servidor (`ps-housing:server:qbxRegisterHouse`). Senão, o client dispara `qb-garages:client:addHouseGarage` com o tipo `house`.

### qb-banking

Com `Config.QBManagement = true`, o valor da venda (descontada a comissão do corretor) vai para a conta da imobiliária. Para usar outro boss menu, troque o export dentro do código de venda.

### qb-clothing

Abre o menu de roupas no guarda-roupa e cria a aparência do personagem no primeiro apartamento (`qb-clothes:client:CreateFirstCharacter`), se ele ainda não tiver `skin` na tabela `playerskins`.

### qb-inventory

Se `qb-inventory` estiver iniciado, o stash do apartamento é criado e os itens do apartamento antigo são migrados (`ps-housing:server:createApartmentStash`). Os stashes em si são sempre registrados no `ox_inventory`, mesmo com `Config.Inventory = "qb"`.

---

## Entrypoints para outros recursos

### Exports do servidor

```lua
-- Cadastra uma propriedade. É o que o ps-realtor chama.
exports['ps-housing']:registerProperty(propertyData)

-- Dados da porta principal. isShell = true retorna as coords do door_data;
-- false consulta o doorlock pelo nome ps_mloproperty<id>_<doorIndex>.
local door = exports['ps-housing']:getMainDoor(propertyId, doorIndex, isShell)

-- true se o source tem acesso à propriedade (dono ou com a chave).
local ok = exports['ps-housing']:IsOwner(src, property_id)

-- Tabelas globais em memória.
local properties = exports['ps-housing']:GetProperties()
local apartments = exports['ps-housing']:GetApartments()
```

### Exports do client

```lua
local properties = exports['ps-housing']:GetProperties()
local property   = exports['ps-housing']:GetProperty(property_id)
local apartments = exports['ps-housing']:GetApartments()
local apartment  = exports['ps-housing']:GetApartment(apartmentName)
local shells     = exports['ps-housing']:GetShells()          -- Config.Shells

-- Cria um shell temporário (não ligado a nenhuma propriedade). Retorna a entidade.
local entity = exports['ps-housing']:CreateTempShell(shellName, position, rotation, leaveCb)
local data   = exports['ps-housing']:GetShellData(shellName)
exports['ps-housing']:DespawnTempShell(entity)
```

### Eventos do servidor

```lua
-- Coloca o jogador dentro da propriedade. É o que o recurso de spawn chama ao
-- restaurar quem deslogou dentro de casa. `spawn` marca a origem como spawn.
TriggerServerEvent('ps-housing:server:enterProperty', property_id, spawn, isanmlo)

TriggerServerEvent('ps-housing:server:leaveProperty', property_id)
TriggerServerEvent('ps-housing:server:enterGarden', property_id)
TriggerServerEvent('ps-housing:server:showcaseProperty', property_id)
TriggerServerEvent('ps-housing:server:raidProperty', property_id)

-- Cria o apartamento inicial do personagem. Chamado pelo seletor de apartamento.
TriggerServerEvent('ps-housing:server:createNewApartment', aptLabel)

-- Chaves.
TriggerServerEvent('ps-housing:server:addAccess', property_id, srcToAdd)
TriggerServerEvent('ps-housing:server:removeAccess', property_id, citizenidToRemove)

-- Mobília.
TriggerServerEvent('ps-housing:server:buyFurniture', property_id, items, price, isGarden)
TriggerServerEvent('ps-housing:server:updateFurniture', property_id, item)
TriggerServerEvent('ps-housing:server:removeFurniture', property_id, itemid)
```

### Callbacks do servidor

```lua
-- Lista completa de propriedades e apartamentos.
local data = lib.callback.await('ps-housing:server:requestProperties')

-- Apartamento do citizenid, se tiver.
local apt = lib.callback.await('ps-housing:cb:GetOwnedApartment', false, cid)

-- Dados da porta principal de um MLO.
local door = lib.callback.await('ps-housing:cb:getMainMloDoor', false, propertyId, doorIndex)

-- Mobília, jogadores dentro, quem tem a chave, e os dados do imóvel.
lib.callback.await('ps-housing:cb:getFurnitures', false, property_id)
lib.callback.await('ps-housing:cb:getPlayersInProperty', false, property_id)
lib.callback.await('ps-housing:cb:getPlayersWithAccess', false, property_id)
lib.callback.await('ps-housing:cb:getPropertyInfo', false, property_id)
```

### Evento para o seletor de apartamento

O recurso dispara `ps-housing:setApartments` no client com a lista de apartamentos disponíveis. O patch do `qbx_properties` (descrito no README de instalação) escuta esse evento para montar a tela de escolha do apartamento inicial.

---

## Estrutura de arquivos

```
ps-housing/
├── shared/
│   ├── config.lua                — todas as opções, apartamentos, shells, móveis
│   └── framework.lua             — bridges ox/qb: target, notify, radial, inventário, logs
├── client/
│   ├── client.lua                — bootstrap, exports de leitura, diálogos de confirmação
│   ├── cl_property.lua           — entradas, menus radiais, chaves, garagem, doorlock
│   ├── apartment.lua             — entrada do prédio, lista de apartamentos
│   ├── shell.lua                 — spawn/despawn de shells, shells temporários
│   ├── modeler.lua               — posicionador de mobília (freecam + NUI)
│   └── migrate.lua               — /migratehouses
├── server/
│   ├── server.lua                — registro de propriedades, apartamento inicial, doorlock, callbacks
│   ├── sv_property.lua           — classe Property: entrar, sair, invadir, chaves, mobília, stash
│   ├── db.lua                    — cria a tabela properties no start, se não existir
│   └── migrate.lua               — /migrateapartments
├── html/                         — build da UI (index.html, index.js, index.css)
├── ui/                           — fonte da UI em Svelte + Vite (não é carregada em runtime)
├── README - INSTALL INSTRUCTIONS/
│   ├── QBCore/
│   │   ├── properties.sql        — schema para QBCore
│   │   ├── README.md             — patches necessários
│   │   └── qb-doorlock/server/main.lua
│   └── QBOX/
│       ├── properties.sql        — schema para Qbox
│       └── README.md             — patches em qbx_core, qbx_spawn, qbx_properties e ox_doorlock
└── fxmanifest.lua
```
