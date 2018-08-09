From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/entry/64: Remove %ebx handling from
 error_entry/exit
Date: Thu, 09 Aug 2018 13:41:41 +0100
Message-ID: <1533818501.5775.4.camel__3329.27984786711$1533818505$gmane$org@infradead.org>
References: <6A458833-F161-4C0A-8DFF-8757EDA36D5C@amacapital.net>
 <1533749748-25861-1-git-send-email-srn@prgmr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2176110506250376400=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3727=ky=twosheds.srs.infradead.org=batv+c85c106e07b9920ebbc6+5464+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1fnkGv-0008Ll-Dn
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 12:42:33 +0000
In-Reply-To: <1533749748-25861-1-git-send-email-srn@prgmr.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sarah Newman <srn@prgmr.com>, stable@vger.kernel.org, "Durand
 Wesolowski, Jimmy" <jdw@amazon.de>
Cc: Juergen Gross <jgross@suse.com>, Brian Gerst <brgerst@gmail.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org


--===============2176110506250376400==
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/x-pkcs7-signature"; boundary="=-Ix2L9eLSAW6zrjiPV4yr"


--=-Ix2L9eLSAW6zrjiPV4yr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-08-08 at 10:35 -0700, Sarah Newman wrote:
> commit b3681dd548d06deb2e1573890829dff4b15abf46 upstream.
>=20
> This version applies to v4.9.

I think you can kill the 'xorl %ebx,%ebx' from error_entry too but yes,
this does want to go to 4.9 and earlier because the 'Fixes:' tag is a
bit of a lie =E2=80=94 the problem existed before that, at least in theory.

> From Andy Lutomirski, original author:
>=20
> error_entry and error_exit communicate the user vs kernel status of
> the frame using %ebx.=C2=A0=C2=A0This is unnecessary -- the information i=
s in
> regs->cs.=C2=A0=C2=A0Just use regs->cs.
>=20
> This makes error_entry simpler and makes error_exit more robust.
>=20
> It also fixes a nasty bug.=C2=A0=C2=A0Before all the Spectre nonsense, Th=
e
> xen_failsafe_callback entry point returned like this:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ALLOC_PT_GPREGS_ON_STACK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SAVE_C_REGS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SAVE_EXTRA_REGS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ENCODE_FRAME_POINTER
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jmp=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0error_exit
>=20
> And it did not go through error_entry.=C2=A0=C2=A0This was bogus: RBX
> contained garbage, and error_exit expected a flag in RBX.
> Fortunately, it generally contained *nonzero* garbage, so the
> correct code path was used.=C2=A0=C2=A0As part of the Spectre fixes, code=
 was
> added to clear RBX to mitigate certain speculation attacks.=C2=A0=C2=A0No=
w,
> depending on kernel configuration, RBX got zeroed and, when running
> some Wine workloads, the kernel crashes.=C2=A0=C2=A0This was introduced b=
y:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0commit 3ac6d8c787b8 ("x86/entry/64: Clear registe=
rs for
> =C2=A0=C2=A0=C2=A0=C2=A0exceptions/interrupts, to reduce speculation atta=
ck surface")
>=20
> With this patch applied, RBX is no longer needed as a flag, and the
> problem goes away.
>=20
> I suspect that malicious userspace could use this bug to crash the
> kernel even without the offending patch applied, though.
>=20
> [Historical note: I wrote this patch as a cleanup before I was aware
> =C2=A0of the bug it fixed.]
>=20
> [Note to stable maintainers: this should probably get applied to all
> =C2=A0kernels.]
>=20
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> Cc: stable@vger.kernel.org
> Cc: Andy Lutomirski <luto@kernel.org>
> Fixes: 3ac6d8c787b8 ("x86/entry/64: Clear registers for
> exceptions/interrupts, to reduce speculation attack surface")
> Reported-and-tested-by: "M. Vefa Bicakci" <m.v.b@runbox.com>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Sarah Newman <srn@prgmr.com>
> ---
> =C2=A0arch/x86/entry/entry_64.S | 19 ++++---------------
> =C2=A01 file changed, 4 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index d58d8dc..0dab47a 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -774,7 +774,7 @@ ENTRY(\sym)
> =C2=A0
> =C2=A0	call	\do_sym
> =C2=A0
> -	jmp	error_exit			/* %ebx: no
> swapgs flag */
> +	jmp	error_exit
> =C2=A0	.endif
> =C2=A0END(\sym)
> =C2=A0.endm
> @@ -1043,7 +1043,6 @@ END(paranoid_exit)
> =C2=A0
> =C2=A0/*
> =C2=A0 * Save all registers in pt_regs, and switch gs if needed.
> - * Return: EBX=3D0: came from user mode; EBX=3D1: otherwise
> =C2=A0 */
> =C2=A0ENTRY(error_entry)
> =C2=A0	cld
> @@ -1087,7 +1086,6 @@ ENTRY(error_entry)
> =C2=A0	=C2=A0* for these here too.
> =C2=A0	=C2=A0*/
> =C2=A0.Lerror_kernelspace:
> -	incl	%ebx
> =C2=A0	leaq	native_irq_return_iret(%rip), %rcx
> =C2=A0	cmpq	%rcx, RIP+8(%rsp)
> =C2=A0	je	.Lerror_bad_iret
> @@ -1119,28 +1117,19 @@ ENTRY(error_entry)
> =C2=A0
> =C2=A0	/*
> =C2=A0	=C2=A0* Pretend that the exception came from user mode: set up
> pt_regs
> -	=C2=A0* as if we faulted immediately after IRET and clear EBX so
> that
> -	=C2=A0* error_exit knows that we will be returning to user mode.
> +	=C2=A0* as if we faulted immediately after IRET.
> =C2=A0	=C2=A0*/
> =C2=A0	mov	%rsp, %rdi
> =C2=A0	call	fixup_bad_iret
> =C2=A0	mov	%rax, %rsp
> -	decl	%ebx
> =C2=A0	jmp	.Lerror_entry_from_usermode_after_swapgs
> =C2=A0END(error_entry)
> =C2=A0
> -
> -/*
> - * On entry, EBX is a "return to kernel mode" flag:
> - *=C2=A0=C2=A0=C2=A01: already in kernel mode, don't need SWAPGS
> - *=C2=A0=C2=A0=C2=A00: user gsbase is loaded, we need SWAPGS and standar=
d
> preparation for return to usermode
> - */
> =C2=A0ENTRY(error_exit)
> -	movl	%ebx, %eax
> =C2=A0	DISABLE_INTERRUPTS(CLBR_NONE)
> =C2=A0	TRACE_IRQS_OFF
> -	testl	%eax, %eax
> -	jnz	retint_kernel
> +	testb	$3, CS(%rsp)
> +	jz	retint_kernel
> =C2=A0	jmp	retint_user
> =C2=A0END(error_exit)
> =C2=A0
--=-Ix2L9eLSAW6zrjiPV4yr
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEFQw
ggUxMIIEGaADAgECAhBNRhEyk/HZ7naOeTHWrzuAMA0GCSqGSIb3DQEBCwUAMIGXMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYD
VQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0xNzEyMjEwMDAwMDBaFw0xODEyMjEyMzU5
NTlaMCQxIjAgBgkqhkiG9w0BCQEWE2R3bXcyQGluZnJhZGVhZC5vcmcwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDgzLNWa18DNpGUj/ZeH0Sgz53ESIbzdPw3OJeuNP6jZhxZojbyfxbM
hETscxI/Hj6UZ4a7sHm5BkVjlsB1Af2Za/PXUt8MmLAcPMHkMPGunvkUibEvblDvpqMkQZlaZM+t
5PqFmWkbehLaEvbpNY7dmEAAeKh4klTzJzrr5AAzaCQ32cA2e3+DEIv5O5l9ViMIjy/JM+xMQrfX
3PZ0chY1PaVWjg59d4Uno+5LRDbgCnPkKJX4ysBGadibjBGQGJEZCjh94iiEebn2KsRLvtrJ72Ph
3W2HDEdngW3YP0wujFQVs81U7L8XN3kdPRsa9zNqGtYQP/+1KMMJQ57hnfi9AgMBAAGjggHpMIIB
5TAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNVHQ4EFgQUpL+/5lli9jmj2KHj
ryyhnB2xRt0wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwIAYDVR0lBBkwFwYIKwYBBQUH
AwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNVHSAEPzA9MDsGDCsGAQQBsjEB
AgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8E
UzBRME+gTaBLhklodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50
aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKG
SWh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5k
U2VjdXJlRW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAe
BgNVHREEFzAVgRNkd213MkBpbmZyYWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQCK28BdbVJ9
QKQqTDfXwogAYiRBEGptfE1Bjy4F5vC6eWJqOJ15vunxjLwdbZYb4L0qrJlh+ZHHHlbIK8uEZu7N
XHUntmWMbGbZiu7JgrbSXJK1ct9gxrN/sdWYJ+JDjVHg7GfDTvTTPa26JMRqJsO1TjjyDX7A3K39
TjV8C0hqXvwF9BsNf+qBeWO6GVzJ5572awY221hc1umibmZaKV4fg+7fS7qscx5TSuIc6uvMBQhm
7NQiCq6euMMWBDUDlotQCDW0ilm0OuLW3IVLuZCm6Msc+6hT9+dCT4JUvxTHZnnO7uLCxV+Ujad+
PH3itRm38i96p2zvwgLr8vwWA0ckMIIFMTCCBBmgAwIBAgIQTUYRMpPx2e52jnkx1q87gDANBgkq
hkiG9w0BAQsFADCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENP
TU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTcx
MjIxMDAwMDAwWhcNMTgxMjIxMjM1OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRl
YWQub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4MyzVmtfAzaRlI/2Xh9EoM+d
xEiG83T8NziXrjT+o2YcWaI28n8WzIRE7HMSPx4+lGeGu7B5uQZFY5bAdQH9mWvz11LfDJiwHDzB
5DDxrp75FImxL25Q76ajJEGZWmTPreT6hZlpG3oS2hL26TWO3ZhAAHioeJJU8yc66+QAM2gkN9nA
Nnt/gxCL+TuZfVYjCI8vyTPsTEK319z2dHIWNT2lVo4OfXeFJ6PuS0Q24Apz5CiV+MrARmnYm4wR
kBiRGQo4feIohHm59irES77aye9j4d1thwxHZ4Ft2D9MLoxUFbPNVOy/Fzd5HT0bGvczahrWED//
tSjDCUOe4Z34vQIDAQABo4IB6TCCAeUwHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8Aw
HQYDVR0OBBYEFKS/v+ZZYvY5o9ih468soZwdsUbdMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8E
AjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsrBgEEAbIxAQMFAjARBglghkgBhvhCAQEEBAMCBSAw
RgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEwKzApBggrBgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUu
Y29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybC5jb21vZG9jYS5jb20v
Q09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNybDCBiwYIKwYB
BQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FD
bGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRw
Oi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkq
hkiG9w0BAQsFAAOCAQEAitvAXW1SfUCkKkw318KIAGIkQRBqbXxNQY8uBebwunliajideb7p8Yy8
HW2WG+C9KqyZYfmRxx5WyCvLhGbuzVx1J7ZljGxm2YruyYK20lyStXLfYMazf7HVmCfiQ41R4Oxn
w0700z2tuiTEaibDtU448g1+wNyt/U41fAtIal78BfQbDX/qgXljuhlcyeee9msGNttYXNbpom5m
WileH4Pu30u6rHMeU0riHOrrzAUIZuzUIgqunrjDFgQ1A5aLUAg1tIpZtDri1tyFS7mQpujLHPuo
U/fnQk+CVL8Ux2Z5zu7iwsVflI2nfjx94rUZt/Iveqds78IC6/L8FgNHJDCCBeYwggPOoAMCAQIC
EGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQI
ExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBD
QSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4X
DTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBM
aW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2Vj
dXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrOeV6wodnVAFsc4
A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf+bGBSyD9aH95dDSmeny1
nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0Zf
xcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2
jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO
4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY
7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNV
HRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRw
Oi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBx
BggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9E
T1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20w
DQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo
7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaBQ+39
4k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtlenlx
Bhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPtTbq7
vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5UY5g2xANP
ECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7EuTecP/CFtR72
uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2niOYihZ+FCbtf3D9
mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4ognzgXtgtdk3ShrtOS1iA
N2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQ
px9/s81rgzdEZOofSlZHynoSMYIDxzCCA8MCAQEwgawwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQI
ExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBD
QSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQg
U2VjdXJlIEVtYWlsIENBAhBNRhEyk/HZ7naOeTHWrzuAMA0GCWCGSAFlAwQCAQUAoIIB6zAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xODA4MDkxMjQxNDFaMC8GCSqG
SIb3DQEJBDEiBCAuS/BHiUNlfq9QcuAsPQeQF4oOB2b2iuQVVY49hMdfpTCBvQYJKwYBBAGCNxAE
MYGvMIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RP
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQTUYRMpPx2e52
jnkx1q87gDCBvwYLKoZIhvcNAQkQAgsxga+ggawwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBM
aW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2Vj
dXJlIEVtYWlsIENBAhBNRhEyk/HZ7naOeTHWrzuAMA0GCSqGSIb3DQEBAQUABIIBAKXRnBKNaJLH
Dw6NR0RoOJCLj5oLhODNTswOzXQxfkhnpASivi+icCt75XCx+ZM+P3ClZY+AzxJVOQ1M8tNiELde
V+1eyN2MoBdrk8uW9jrOeY/H3/ws3UA0LVjI0O05a+nKzqzJRu1z7Cd1GXTUmfUJQpzYEYTQC9R/
jlQgVdxv/nsbtt9pPOFcB5EbnD+3IGY2N/WIL/CklTEAjY7Wwgb7woM/lBPkYz5KTlR90K4Glq6/
u9O/9lZUKY4+sGM7nBTr14G3GGysywQ8DsdeYHjYoDl+RiFQLDeLtYK3cx7s53TAnfOoWvi2wAmz
5kbOyPlyy/BF/aX6cpkOM2qCXY4AAAAAAAA=


--=-Ix2L9eLSAW6zrjiPV4yr--



--===============2176110506250376400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2176110506250376400==--
