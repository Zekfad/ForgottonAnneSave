# Forgotton Anne Save decryptor/encryptor

These scripts will help you to edit save file of [Forfotton Anne](https://store.steampowered.com/app/542050) game.
Game save is a plain JSON file stored as encrypted binary.

# Usage

## Common

Use `Get-Help .\dumper.ps1 -Detailed` or `Get-Help .\compiler.ps1 -Detailed` to get the usage help offline.

## Dumper

Use `dumper.ps1` to dump the encrypted save file to plain JSON.

### Example

```
.\dumper.ps1 -saveFile ./ForgottonAnne-Save.new.json -dumpFile ./ForgottonAnne-Save.dump.json
```

### Parameters

#### -saveFile `<String>`

Location of encrypted save file.

Default is `./ForgottonAnne-Save.new.json`.

#### -dumpFile `<String>`

Location of output file.

Default is `./ForgottonAnne-Save.dump.json`.

## Compiler

Use `Compiler.ps1` to encrypt dump back to binary readable by the game.

### Example

```
.\compiler.ps1 -dumpFile ./ForgottonAnne-Save.dump.json -saveFile ./ForgottonAnne-Save.new.json
```

### Parameters

#### -dumpFile `<String>`

Location of decrypted dump file.

Default is `./ForgottonAnne-Save.dump.json`.

#### -saveFile `<String>`

Location of output file.

Default is `./ForgottonAnne-Save.new.json`.
