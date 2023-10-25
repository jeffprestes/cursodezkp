# cursodezkp
Cruso de ZKP - Circom

## TAU

Baixar arquivo TAU da Hermez [powersOfTau28_hez_final_15.ptau](https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_15.ptau) que suporta 32k de constraints.

## Instalação das ferramentas

### Circom

https://docs.circom.io/getting-started/installation/

### Snarkjs

https://github.com/iden3/snarkjs

### Referencia tecnica

https://docs.circom.io/getting-started/installation/

### Comandos para multiplicador

```shell
cd exemplo-multiplicador
circom multiplicador.circom --r1cs --wasm --sym

snarkjs groth16 setup multiplicador.r1cs ../powersOfTau28_hez_final_15.ptau multiplicador_00.zkey
snarkjs zkey contribute multiplicador_00.zkey multiplicador_01.zkey --name="1a contribuicao"
snarkjs zkey export verificationkey multiplicador_01.zkey chave-verificacao.json

node multiplicador_js/generate_witness.js multiplicador_js/multiplicador.wasm valores-entrada.json testemunha.wtns
snarkjs groth16 prove multiplicador_01.zkey testemunha.wtns prova.json valores-entrada-publica.json
snarkjs groth16 verify chave-verificacao.json valores-entrada-publica.json prova.json 

snarkjs zkey export solidityverifier multiplicador_01.zkey verificador.sol
snarkjs zkey export soliditycalldata valores-entrada-publica.json prova.json > valores-entrada-solidity.txt
```

### Comandos para validador conta

```shell
cd exemplo-validaconta
circom validaconta.circom --r1cs --wasm --sym

snarkjs groth16 setup validaconta.r1cs ../powersOfTau28_hez_final_15.ptau validaconta_00.zkey
snarkjs zkey contribute validaconta_00.zkey validaconta_01.zkey --name="1a contribuicao"
snarkjs zkey export verificationkey validaconta_01.zkey chave-verificacao.json

node validaconta_js/generate_witness.js validaconta_js/validaconta.wasm valores-entrada.json testemunha.wtns
snarkjs groth16 prove validaconta_01.zkey testemunha.wtns prova.json valores-entrada-publica.json
snarkjs groth16 verify chave-verificacao.json valores-entrada-publica.json prova.json 

snarkjs zkey export solidityverifier validaconta_01.zkey verificador.sol
snarkjs zkey export soliditycalldata valores-entrada-publica.json prova.json > valores-entrada-solidity.txt
```