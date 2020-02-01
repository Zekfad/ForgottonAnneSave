class ForgottonAnneSave {
	static [string] $initVector = 'luf754hdgs54kfo0';
	[byte[]] $initVectorBytes;
	#static [string] $salt = '';
	[byte[]] $saltBytes;
	[Security.Cryptography.PasswordDeriveBytes] $key;
	[byte[]] $keyBytes;
	[System.Security.Cryptography.RijndaelManaged] $rm;

	ForgottonAnneSave() {
		$this.initVectorBytes = [Text.Encoding]::UTF8.GetBytes([ForgottonAnneSave]::initVector);
		$this.saltBytes = (New-Object byte[] 0);
		$this.key = (New-Object Security.Cryptography.PasswordDeriveBytes('d7gG@WSF879D49j045', $this.saltBytes));
		$this.keyBytes = $this.key.GetBytes(32);
		$this.rm = New-Object System.Security.Cryptography.RijndaelManaged;
		$this.rm.Mode = [System.Security.Cryptography.CipherMode]::CBC;
	}

	[byte[]] Encrypt([string] $stringToEncrypt) {
		$plainTextBytes = [Text.Encoding]::UTF8.GetBytes($stringToEncrypt);

		$c = $this.rm.CreateEncryptor($this.keyBytes, $this.initVectorBytes);
		$ms = New-Object IO.MemoryStream;
		$cs = New-Object Security.Cryptography.CryptoStream($ms, $c, "Write");

		$cs.Write($plainTextBytes, 0, $plainTextBytes.Length);
		$cs.FlushFinalBlock();

		[byte[]] $cipherTextBytes = $ms.ToArray();

		$cs.Close();
		$ms.Close();
		#$rm.Clear();

		return $cipherTextBytes;
	}

	[string] Decrypt([byte[]] $cipherTextBytes) {
		$d = $this.rm.CreateDecryptor($this.keyBytes, $this.initVectorBytes)

		$ms = new-Object IO.MemoryStream @(, $cipherTextBytes);
		$cs = new-Object Security.Cryptography.CryptoStream($ms, $d, "Read");

		$decryptedByteCount = 0;
		$decryptedByteCount = $cs.Read($cipherTextBytes, 0, $cipherTextBytes.Length);

		$cs.Close();
		$ms.Close();
		#$rm.Clear();

		return [Text.Encoding]::UTF8.GetString($cipherTextBytes, 0, $decryptedByteCount).TrimEnd([char]0x0000);
	}
}