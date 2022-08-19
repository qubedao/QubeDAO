# 01. USDQ minter SC

Smart-contract which lends USDQ to users if they put in some TON.

Basically, price of USDQ lending is $1.15 - and if users are careful, they can return those $1.15 by burning USDQ.

### Operations and ABI

| Operation           | Opcode     | Direction | Filter         | Message body          |
| ------------------- | ---------- | --------- | -------------- | --------------------- |
| Donate              | 0          | inbound   | -              | -                     |
| Put TON             | 1          | inbound   | -              | -                     |
| Lend USDQ           | 2          | inbound   | -              | nanoUSDQs (u64)       |
| Take TON            | 3          | inbound   | -              | nanoTONs (u64)        |
| Update lending rate | 10         | inbound   | QBD holders    | rate\* (u32)          |
| Update TON-USD rate | 11         | inbound   | price oracle   | microUSD/TON (u64)    |
| Update SC data      | 10000      | inbound   | QBD holders    | ^new_data (Cell)      |
| Update SC code      | 10001      | inbound   | QBD holders    | ^new_code (Cell)      |
| Burn (return) USDQ  | 0x7bdd97de | inbound   | USDQ wallet    | FT standard-compliant |
| Mint USDQ           | 0x178d4519 | outbound  | USDQ wallet    | FT standard-compliant |
| Ask to burn USDQ    | 1          | outbound  | liquidity pool | nanoUSDQs (u64)       |
| Ask to burn QBD     | 1          | outbound  | QBD holders    | -                     |
| Give/return TON     | -          | outbound  | user/pool      | -                     |
