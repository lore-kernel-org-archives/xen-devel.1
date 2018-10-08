From: Alan.Robinson@ts.fujitsu.com (Alan Robinson)
Subject: Re: [PATCH 3/5] xen/domain: Audit config->max_vcpus
 during {, arch_}check_domain_config()
Date: Mon, 8 Oct 2018 08:44:52 +0200
Message-ID: <20181008064452.GA14171@ts.fujitsu.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
Reply-To: Alan.Robinson@ts.fujitsu.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5570080973338476945=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5570080973338476945==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha-256; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2018 at 04:54:47PM +0200, Andrew Cooper wrote:
> The purpose of this is to move the auduting to be earlier than
> arch_domain_create().
>=20

s/auduting/auditing/

Alan


--TB36FDmn/VVEgNH/
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIKTgYJKoZIhvcNAQcCoIIKPzCCCjsCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
CH8wggSjMIIDi6ADAgECAgo2C52zAAAAAlTDMA0GCSqGSIb3DQEBBQUAMC8xLTArBgNVBAMT
JEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQTAeFw0xNzA1MTIxNTM0Mjda
Fw0xOTAzMTExMjI0NTlaMEAxFzAVBgNVBAMMDlJvYmluc29uLCBBbGFuMSUwIwYDVQQKDBxG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB
gQClZEMpN68qHzred2QKqifLuUSlYnt/kB4V9Kjy8U7cQK/pN+ytbEBFXsllMyP2CjgGNYFu
oqeztgkla2vBrjV9ilrJe3s+RJqkXgioKG1RSuiDW0sBFvI90dS4mHCH7cOTPPFHO5QHuCBU
bClqAN0HlKweu/rIbqg0/g9j+SMb8QIDAQABo4ICMjCCAi4wCwYDVR0PBAQDAgWgMIGSBgNV
HREEgYowgYeBHGFsYW4ucm9iaW5zb25AdHMuZnVqaXRzdS5jb22BJmFsYW4ucm9iaW5zb25A
ZW1laWFjZW1lYS5mdWppdHN1LmxvY2FsgRxhbGFuLnJvYmluc29uQGNlbWFpbC5mc2MubmV0
gSFBbGFuLlJvYmluc29uQGZ1aml0c3Utc2llbWVucy5jb20wHQYDVR0OBBYEFIlosAD8kas+
gZn51OiifJoSRQTUMB8GA1UdIwQYMBaAFAj1yGq/gON7UMQ59AeYRuhtfpeoMDwGA1UdHwQ1
MDMwMaAvoC2GK2h0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20vY2RwL2Z0czAxdXNlci5jcmww
RwYIKwYBBQUHAQEEOzA5MDcGCCsGAQUFBzAChitodHRwOi8vYWlhLnRzLmZ1aml0c3UuY29t
L2FpYS9mdHMwMXVzZXIuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGCNxUHBDAwLgYmKwYB
BAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYDVR0lBAwwCgYI
KwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0BCQ8ENzA1
MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcNAwcw
DQYJKoZIhvcNAQEFBQADggEBADwUZHvoZuxiGLFQCoURq/FgeKSyxKrjuoutb8Bs3blR2QDA
D3NWp0W+T4Js9fDcIb3Rq3uvFx0T/EcUiz1fFeQyN4B2xT8ofAnZeWuxWxWLUqS/K73fRIUC
m7DUNj8lgRGsnSnAIl6ZKHDrdvwnxrF7qFPRVz77B4k3BK5mkMxxNVtKjbCoPj8fnh17Vnob
Wnb0yztrPYeOHi2CqIey5qPjVMSTxKJYOejwjvE78SBMKKQS7cHBg+iOnYK90S0m+LK2/Yz5
vgJtjGJL+68d5i0O/rmzgefOEeuMtD0IOI9lFXoUS16hbxj8gMy0dXKxfPhoYWB7bqIlY4Ri
mpguPFwwggPUMIICvKADAgECAhA0zRJXyDaDRuC/9z0wA24FMA0GCSqGSIb3DQEBBQUAMC8x
LTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgUm9vdCBDQTAeFw0wOTAz
MTIxMjI0NTlaFw0xOTAzMTExMjI0NTlaMC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9n
eSBTb2x1dGlvbnMgVXNlciBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALAb
TX9HzfBJFvcukKqEBkui1MHs3p1dgZw8zkXRmp7pEbaRs2DAD3cosLZadP8zjWvowiRs5F+I
mAo07Iib8dNUj0TWduHx2hRl6SQV+ffaumRdIrLvodWiGrNbX8ggWpQGyii7zYCLkI514XX3
1ZOL0rgcrTtzhnFC7SdvpWFUhL8cxrfYk0sE+UZxLyqUdIjgvvf1DVTojyvVws+bu24N4noT
+YA/r+brt2CEcFf+YMnewGT3HJE32D/xmXMm3AF3xJeZ2/22Ykix3mRI8TDDPGGahSoR/ccp
iHY5HESuzSdo/Dg+9PEBb+G+G5ntZhxn040m8W9ZzqFE7DbbIWcCAwEAAaOB6zCB6DAdBgNV
HQ4EFgQUCPXIar+A43tQxDn0B5hG6G1+l6gwCwYDVR0PBAQDAgGGMB8GA1UdIwQYMBaAFBR1
4le2FTcVgCqX5VFIZazPhpDLMBIGA1UdEwEB/wQIMAYBAf8CAQAwRwYIKwYBBQUHAQEEOzA5
MDcGCCsGAQUFBzAChitodHRwOi8vYWlhLnRzLmZ1aml0c3UuY29tL2FpYS9mdHMwMXJvb3Qu
Y2VyMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20vY2RwL2Z0
czAxcm9vdC5jcmwwDQYJKoZIhvcNAQEFBQADggEBAEO6UD/S8PW3J7dQ4b1eVFm9c5pwAkqO
p+sfm7qXJEM5a392iex0GYoGbmgmpPnXsS9fCPOojQwziQQbK89A3A+Fz7M3C01Hs6qhpQMi
G74gauZsAxwFgQPRddRkcei3axzCjXRz8AFsgt6+qr+BjugPs9eilGRUj+JL7mjeWByOPNU+
xRcRJp7ZMpaYZ3V/upkNTQAQKTDIV9GjeXVYTwDAD/JxDSdYRpPNSBvIM5KBwz0qCwrX3wJz
YWAKob6wztsm12//cfkn9w0LswYN4aQdciTNyvH6EGkt7k6RSE33TKa3EMqyHZeCcNurP+r6
SLNLIi1U6d8gMIDWqkEoMUkxggGXMIIBkwIBATA9MC8xLTArBgNVBAMTJEZ1aml0c3UgVGVj
aG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQQIKNgudswAAAAJUwzAJBgUrDgMCGgUAoIGxMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE4MTAwODA2NDQ1Mlow
IwYJKoZIhvcNAQkEMRYEFEqWQ6kuYnw++YZ41ztTjZkCVGtxMFIGCSqGSIb3DQEJDzFFMEMw
CgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIGAgTq6iK9dEFtazLf63VAszzEcn6FbbpMW
AQU+61mo6u9coxfcsBJvThP4sWRdIGO5ZmyRFrHHmOj1Cbof7zTgjmXnsouK5esiQEJVZIyg
/FfKin1Ci8tsnTgSOmn+BpgeKHCbyPTDZR65Cf2zqV5uijNsVDMezQGXvIkr/wRNl/M=

--TB36FDmn/VVEgNH/--


--===============5570080973338476945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5570080973338476945==--
