rule CredentialPKIDSAPEM : Credential PKI DSA {

    meta:
        name        = "PEM format private key (DSA)"
        author      = "Peter Adkins"
        version     = "0.2.0"
        accuracy    = 100
        description = "Potential PEM format DSA private key found."

    strings:
        $pkcs1_0 = /-----BEGIN DSA PRIVATE KEY-----(\n|\\n)MII[A-Z0-9=+\/]{20,}/ ascii wide nocase
        $pkcs1_1 = /-----BEGIN DSA ENCRYPTED PRIVATE KEY-----(\n|\\n)Proc-Type:\s*4,/ ascii wide nocase
        $pkcs1_2 = /-----BEGIN DSA PRIVATE KEY-----(\n|\\n)Proc-Type:\s*4,/ ascii wide nocase

    condition:
        $pkcs1_0 or $pkcs1_1 or $pkcs1_2
}
