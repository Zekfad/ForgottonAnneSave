$settings = @{
	Rules = @{
		PSUseCompatibleSyntax = @{
			Enable = $true
			TargetVersions = @(
				'5.0'
			)
		}
	}
};

Invoke-ScriptAnalyzer -Path ./ForgottonAnneSave.psm1 -Settings $settings
Invoke-ScriptAnalyzer -Path ./dumper.ps1 -Settings $settings
Invoke-ScriptAnalyzer -Path ./compiler.ps1 -Settings $settings