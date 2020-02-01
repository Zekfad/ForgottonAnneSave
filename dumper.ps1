<#
.SYNOPSIS
	Forgotton Anne save decrypter.
.DESCRIPTION
	Decrypts provided save file to plain text.
.PARAMETER saveFile
	Location of encrypted save file.
	Default is "./ForgottonAnne-Save.new.json".
.PARAMETER dumpFile
	Location of output file.
	Default is "./ForgottonAnne-Save.dump.json".
.NOTES
	Version:       1.0
	Author:        Zekfad
	Creation Date: 31.01.2020
.EXAMPLE
	.\dumper.ps1 -saveFile ./ForgottonAnne-Save.new.json -dumpFile ./ForgottonAnne-Save.dump.json
.LINK
	https://github.com/Zekfad/ForgottonAnneSave
#>

#requires -Version 5.0
Using module .\ForgottonAnneSave.psm1;

param(
	[string] $saveFile = './ForgottonAnne-Save.json',
	[string] $dumpFile = './ForgottonAnne-Save.dump.json'
)

[ForgottonAnneSave] $fas = [ForgottonAnneSave]::new();

[byte[]] $save = [System.IO.File]::ReadAllBytes($saveFile);
[string[]] $saveDecrypted = $fas.Decrypt($save);
[byte[]] $saveDecryptedBytes = [Text.Encoding]::UTF8.GetBytes($saveDecrypted);
[System.IO.File]::WriteAllBytes($dumpFile, $saveDecryptedBytes);
