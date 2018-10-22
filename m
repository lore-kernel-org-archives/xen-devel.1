From: "Woodhouse, David" <dwmw@amazon.co.uk>
Subject: Re: Ongoing/future speculative mitigation work
Date: Mon, 22 Oct 2018 15:09:09 +0000
Message-ID: <e58f5942e62215693778678c2fd8d21c922f3803.camel@amazon.co.uk>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2753516746892516327=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
Cc: "JGross@suse.com" <JGross@suse.com>, "sergey.dyasli@citrix.com" <sergey.dyasli@citrix.com>, "lars.kurth@citrix.com" <lars.kurth@citrix.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "dfaggioli@suse.com" <dfaggioli@suse.com>, "Wilson, Matt" <msw@amazon.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "ross.philipson@oracle.com" <ross.philipson@oracle.com>, "mdontu@bitdefender.com" <mdontu@bitdefender.com>, "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "JBeulich@suse.com" <JBeulich@suse.com>, "Liguori,
 Anthony" <aliguori@amazon.com>, "joao.m.martins@oracle.com" <joao.m.martins@oracle.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.co>
List-Id: xen-devel@lists.xenproject.org

--===============2753516746892516327==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/x-pkcs7-signature"; boundary="=-tOKwHZAR+fl/mOHg8w6d"

--=-tOKwHZAR+fl/mOHg8w6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Stefan to Cc.

Should we take this to the spexen or another mailing list?


On Mon, 2018-10-22 at 15:55 +0100, Wei Liu wrote:
> On Thu, Oct 18, 2018 at 06:46:22PM +0100, Andrew Cooper wrote:
> > Hello,
> >=20
> > This is an accumulation and summary of various tasks which have been
> > discussed since the revelation of the speculative security issues in
> > January, and also an invitation to discuss alternative ideas.  They are
> > x86 specific, but a lot of the principles are architecture-agnostic.
> >=20
> > 1) A secrets-free hypervisor.
> >=20
> > Basically every hypercall can be (ab)used by a guest, and used as an
> > arbitrary cache-load gadget.  Logically, this is the first half of a
> > Spectre SP1 gadget, and is usually the first stepping stone to
> > exploiting one of the speculative sidechannels.
> >=20
> > Short of compiling Xen with LLVM's Speculative Load Hardening (which is
> > still experimental, and comes with a ~30% perf hit in the common case),
> > this is unavoidable.  Furthermore, throwing a few array_index_nospec()
> > into the code isn't a viable solution to the problem.
> >=20
> > An alternative option is to have less data mapped into Xen's virtual
> > address space - if a piece of memory isn't mapped, it can't be loaded
> > into the cache.
> >=20
> > An easy first step here is to remove Xen's directmap, which will mean
> > that guests general RAM isn't mapped by default into Xen's address
> > space.  This will come with some performance hit, as the
> > map_domain_page() infrastructure will now have to actually
> > create/destroy mappings, but removing the directmap will cause an
> > improvement for non-speculative security as well (No possibility of
> > ret2dir as an exploit technique).
>=20
> I have looked into making the "separate xenheap domheap with partial
> direct map" mode (see common/page_alloc.c) work but found it not as
> straight forward as it should've been.
>=20
> Before I spend more time on this, I would like some opinions on if there
> is other approach which might be more useful than that mode.
>=20
> >=20
> > Beyond the directmap, there are plenty of other interesting secrets in
> > the Xen heap and other mappings, such as the stacks of the other pcpus.=
=20
> > Fixing this requires moving Xen to having a non-uniform memory layout,
> > and this is much harder to change.  I already experimented with this as
> > a meltdown mitigation around about a year ago, and posted the resulting
> > series on Jan 4th,
> > https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00274.h=
tml,
> > some trivial bits of which have already found their way upstream.
> >=20
> > To have a non-uniform memory layout, Xen may not share L4 pagetables.=
=20
> > i.e. Xen must never have two pcpus which reference the same pagetable i=
n
> > %cr3.
> >=20
> > This property already holds for 32bit PV guests, and all HVM guests, bu=
t
> > 64bit PV guests are the sticking point.  Because Linux has a flat memor=
y
> > layout, when a 64bit PV guest schedules two threads from the same
> > process on separate vcpus, those two vcpus have the same virtual %cr3,
> > and currently, Xen programs the same real %cr3 into hardware.
>=20
> Which bit of Linux code are you referring to? If you remember it off the
> top of your head, it would save me some time digging around. If not,
> never mind, I can look it up myself.
>=20
> >=20
> > If we want Xen to have a non-uniform layout, are two options are:
> > * Fix Linux to have the same non-uniform layout that Xen wants
> > (Backwards compatibility for older 64bit PV guests can be achieved with
> > xen-shim).
> > * Make use XPTI algorithm (specifically, the pagetable sync/copy part)
> > forever more in the future.
> >=20
> > Option 2 isn't great (especially for perf on fixed hardware), but does
> > keep all the necessary changes in Xen.  Option 1 looks to be the better
> > option longterm.
>=20
> What is the problem with 1+2 at the same time? I think XPTI can be
> enabled / disabled on a per-guest basis?
>=20
> Wei.


--=-tOKwHZAR+fl/mOHg8w6d
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEE4w
ggUuMIIEFqADAgECAhEApEtL31g6H7ROXdOiQnA9RjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTcxMjIxMDAwMDAwWhcNMTgxMjIxMjM1
OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFkd213QGFtYXpvbi5jby51azCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAKdGKgXuwKMg2r+i/4BZZC0ddRxNq3xIKTakie/VCSzoO7P17A36ZzUc
VMEYPfqDt/65xoc6Tdih+qkY2pNDppZ1DZ8mVrAX6O2O60ZhmXB60wMoDvXPZInvkMOW4drqnje/
7/NOypn/XQAY+ln4KT+3tHG3TfryyJFMedqC/r29KJlCeeCxIzdtq2j5mN42tvPVv4+p+Kr77uui
GOASNdFJbNdgx7UGF+il6kRGSle17LJZKMgRiLJXYjECwnGwdfLdN5SINWD5IC3yXY8d14Bq6DyD
jNts1DFw+SKhW8kVFYRZpv7TE3/42QJKQVL6YWka5T4EJO7AD3gy2ypRsd8CAwEAAaOCAecwggHj
MB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBT/vhvBExl2wDr8f50u
b+0yzFyZRjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcD
BAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQEC
AQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRT
MFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJ
aHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRT
ZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMBwG
A1UdEQQVMBOBEWR3bXdAYW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUAA4IBAQCK2HofespbCaDu
udwwfh8GxDpVUnVbZZVWScpZMxfYpXzLot7L6iZrr16oMQ+UOiDDAK6/D3+u2QN8u0lJ6yLKVmvh
lGOzDywGsyG2Ohy8Dt5jcEK5sz84OsPtrRH7ahZHLxYPhWlUKOjOPN6sb9h6uMYlXmG/KmAr2rwF
exN6Zrwh6YwF7ukuMs175YcNyYRdB8kVYq3WikfbTHOoRbJiu9Unw7LqnvPTfx+xUvD6aN2CKLtr
mactWbk98swNgbI18UWjfEpugvAqw09CDLjeq7N1v0SkUkQEDqGSUE+hKFryTNXtZ6zOfl+MQfD8
U7T5oJa34DmWXK9+x7dl+MrqMIIFLjCCBBagAwIBAgIRAKRLS99YOh+0Tl3TokJwPUYwDQYJKoZI
hvcNAQELBQAwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAO
BgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE3MTIy
MTAwMDAwMFoXDTE4MTIyMTIzNTk1OVowIjEgMB4GCSqGSIb3DQEJARYRZHdtd0BhbWF6b24uY28u
dWswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnRioF7sCjINq/ov+AWWQtHXUcTat8
SCk2pInv1Qks6Duz9ewN+mc1HFTBGD36g7f+ucaHOk3YofqpGNqTQ6aWdQ2fJlawF+jtjutGYZlw
etMDKA71z2SJ75DDluHa6p43v+/zTsqZ/10AGPpZ+Ck/t7Rxt0368siRTHnagv69vSiZQnngsSM3
bato+ZjeNrbz1b+Pqfiq++7rohjgEjXRSWzXYMe1BhfopepERkpXteyyWSjIEYiyV2IxAsJxsHXy
3TeUiDVg+SAt8l2PHdeAaug8g4zbbNQxcPkioVvJFRWEWab+0xN/+NkCSkFS+mFpGuU+BCTuwA94
MtsqUbHfAgMBAAGjggHnMIIB4zAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNV
HQ4EFgQU/74bwRMZdsA6/H+dLm/tMsxcmUYwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
IAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNV
HSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21v
ZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01P
RE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcB
AQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
Y3NwLmNvbW9kb2NhLmNvbTAcBgNVHREEFTATgRFkd213QGFtYXpvbi5jby51azANBgkqhkiG9w0B
AQsFAAOCAQEAith6H3rKWwmg7rncMH4fBsQ6VVJ1W2WVVknKWTMX2KV8y6Ley+oma69eqDEPlDog
wwCuvw9/rtkDfLtJSesiylZr4ZRjsw8sBrMhtjocvA7eY3BCubM/ODrD7a0R+2oWRy8WD4VpVCjo
zjzerG/YerjGJV5hvypgK9q8BXsTema8IemMBe7pLjLNe+WHDcmEXQfJFWKt1opH20xzqEWyYrvV
J8Oy6p7z038fsVLw+mjdgii7a5mnLVm5PfLMDYGyNfFFo3xKboLwKsNPQgy43quzdb9EpFJEBA6h
klBPoSha8kzV7Weszn5fjEHw/FO0+aCWt+A5llyvfse3ZfjK6jCCBeYwggPOoAMCAQICEGqb4Tg7
/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTEzMDEx
MDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVy
IE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVk
MT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVt
YWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrOeV6wodnVAFsc4A5jTxhh2
IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf+bGBSyD9aH95dDSmeny1nxdlYCeX
IoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0
wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFN
e1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0B
OSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQw
HQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8E
CDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEF
BQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFk
ZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJKoZI
hvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo7EIMERoh
42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaBQ+394k+z3ZBy
WPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtlenlxBhh7ETrN
543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPtTbq7vODqzCM6
ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5UY5g2xANPECTQdu9v
WPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7EuTecP/CFtR72uYRBcunw
wH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2niOYihZ+FCbtf3D9mB12D4ln
9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4ognzgXtgtdk3ShrtOS1iAN2ZBXFiR
mjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81r
gzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBAhEApEtL31g6H7ROXdOiQnA9RjANBglghkgBZQMEAgEFAKCCAe0wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgxMDIyMTUwOTA3WjAvBgkqhkiG9w0B
CQQxIgQgDJrmksu0AU0nIHki2gL7OLt5baAKtfwUIdOZvlZwPKQwgb4GCSsGAQQBgjcQBDGBsDCB
rTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQCkS0vfWDoftE5d06JC
cD1GMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0
ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQCkS0vfWDoftE5d06JCcD1GMA0GCSqGSIb3DQEBAQUABIIBAGXwAHYWq9Bw48tU
X+WUfzYQsHKjospi0cEJZKHJ4KmbYXPtH2meWBNYC8AJihne6yZQnqumSvdMmhC2gsQfa7l+LIpX
4kD0c93+SBbUW6HXNd5NxkKGfQWbmkG5wVDqVers3n4kLXCid7irBfiLGaZUWt6LwDrSvkOe/guf
xO25DSLN9jWGIY2T6A0Ug5oKpcOl5f61OgV5A4RJxzP9EeoDaP0ITBZlKrWs0x0/guGq5LQTlwbk
bk2HieJj0jiiUe8NUcycHezfBFTyZoQMJ+ZygBM9CYmdiuoDJCzcg+UztNMyQaKh8nTygjVkqEQ4
XfWvR6tfJygbpT5hqR9BgP8AAAAAAAA=


--=-tOKwHZAR+fl/mOHg8w6d--

--===============2753516746892516327==
Content-Type: multipart/alternative; boundary="===============4382068346733249383=="
MIME-Version: 1.0
Content-Disposition: inline

--===============4382068346733249383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============4382068346733249383==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============4382068346733249383==--

--===============2753516746892516327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2753516746892516327==--
