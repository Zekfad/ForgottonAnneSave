<#
.SYNOPSIS
	Forgotton Anne save dump encrypter.
.DESCRIPTION
	Encrypts provided save dump file to format can be used by the game.
.PARAMETER dumpFile
	Location of decrypted dump file.
	Default is "./ForgottonAnne-Save.dump.json".
.PARAMETER saveFile
	Location of output file.
	Default is "./ForgottonAnne-Save.new.json".
.NOTES
	Version:       1.0
	Author:        Zekfad
	Creation Date: 31.01.2020
.EXAMPLE
	.\compiler.ps1 -dumpFile ./ForgottonAnne-Save.dump.json -saveFile ./ForgottonAnne-Save.new.json
.LINK
	https://github.com/Zekfad/ForgottonAnneSave
#>

#requires -Version 5.0
Using module .\ForgottonAnneSave.psm1;

param(
	[string] $dumpFile = './ForgottonAnne-Save.dump.json',
	[string] $saveFile = './ForgottonAnne-Save.new.json'
)

[ForgottonAnneSave] $fas = [ForgottonAnneSave]::new();

[byte[]] $saveDumpBytes = [System.IO.File]::ReadAllBytes($dumpFile);
[string] $saveDump = [System.Text.Encoding]::ASCII.GetString($saveDumpBytes);
[byte[]] $saveEncryptedBytes = $fas.Encrypt($saveDump);
[System.IO.File]::WriteAllBytes($saveFile, $saveEncryptedBytes);
