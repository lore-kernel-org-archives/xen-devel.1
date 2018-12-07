From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Patch "x86/entry/64: Remove %ebx handling from
 error_entry/exit" has been added to the 4.9-stable tree
Date: Fri, 07 Dec 2018 20:08:54 +0000
Message-ID: <9ae736ab22cab27e4bc0f98979b0e2dda6c3260a.camel__43017.27114148$1544213304$gmane$org@infradead.org>
References: <153492235124199@kroah.com>
 <5b11beecd1491a3b4441e277240c00c8d0ea965f.camel@infradead.org>
 <D7629DC3-8AB2-4E7D-89A2-96B0DB87AD4E@amacapital.net>
 <b26bfff712aa646f108d4e9eecf73e8707522488.camel@infradead.org>
 <30630129-c017-2b90-45da-2dfda6cf062b@citrix.com>
 <CALCETrW_F=DOKCbE5=wdFSUbKPGPbGw3whu-GruNH0qAR0doEQ@mail.gmail.com>
 <28b566b28d71111d4580d422dda1758f3ca219ef.camel@infradead.org>
 <fa674260a554f8fdf28b5bed40bd7cddbf0d5ab9.camel@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2995606362934476694=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lIl=OQ=merlin.srs.infradead.org=batv+b78563ce31a3ebe2aca5+5584+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1gVMRM-0003WN-9C
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 20:09:36 +0000
In-Reply-To: <fa674260a554f8fdf28b5bed40bd7cddbf0d5ab9.camel@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Lutomirski <luto@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Denys Vlasenko <dvlasenk@redhat.com>, Sarah Newman <srn@prgmr.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, "M. Vefa Bicakci" <m.v.b@runbox.com>, Brian Gerst <brgerst@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, stable <stable@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org


--===============2995606362934476694==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-qvO4m0s2WM5DThPhQaBQ"


--=-qvO4m0s2WM5DThPhQaBQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-12-07 at 12:18 +0000, David Woodhouse wrote:
>=20
> >  #else
> > +             struct multicall_space mc =3D __xen_mc_entry(0);
> > +             MULTI_set_segment_base(mc.mc, SEGBASE_GS_USER_SEL, 0);
> > +
> >               loadsegment(fs, 0);
> >  #endif
>=20
> That seems to boot and run, at least.
>=20
> I'm going to experiment with sticking a SCHEDOP_yield in the batch
> *after* the update_descriptor requests, to see if I can trigger the
> original problem a bit quicker than my current method =E2=80=94 which inv=
olves
> running a hundred machines for a day or two.

That SCHEDOP_yield and some debug output in xen_failsafe_callback shows
that it's nice and easy to reproduce now without the above
MULTI_set_segment_base() call. And stopped happening when I add the
MULTI_set_segment_base() call back again. I'll call that 'tested'.

But now we're making a hypercall to clear user %gs even in the case
where none of the descriptors have changed; we should probably stop
doing that...

Testing this (incremental) variant now.

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -688,7 +688,7 @@ static inline bool desc_equal(const struct desc_struct =
*d1,
 }
=20
 static void load_TLS_descriptor(struct thread_struct *t,
-                               unsigned int cpu, unsigned int i)
+                               unsigned int cpu, unsigned int i, int flush=
_gs)
 {
        struct desc_struct *shadow =3D &per_cpu(shadow_tls_desc, cpu).desc[=
i];
        struct desc_struct *gdt;
@@ -698,6 +698,15 @@ static void load_TLS_descriptor(struct thread_struct *=
t,
        if (desc_equal(shadow, &t->tls_array[i]))
                return;
=20
+       /*
+        * If the current user %gs points to a descriptor we're changing,
+        * zero it first to avoid taking a fault if Xen preempts this
+        * vCPU between now and the time that %gs is later loaded with
+        * the new value.
+        */
+       if ((flush_gs >> 3) =3D=3D GDT_ENTRY_TLS_MIN + i)
+               MULTI_set_segment_base(mc.mc, SEGBASE_GS_USER_SEL, 0);
+
        *shadow =3D t->tls_array[i];
=20
        gdt =3D get_cpu_gdt_table(cpu);
@@ -709,7 +718,7 @@ static void load_TLS_descriptor(struct thread_struct *t=
,
=20
 static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 {
-       xen_mc_batch();
+       u16 flush_gs =3D 0;
=20
        /*
         * XXX sleazy hack: If we're being called in a lazy-cpu zone
@@ -723,17 +732,19 @@ static void xen_load_tls(struct thread_struct *t, uns=
igned int cpu)
         *
         * For x86_64, we need to zero %fs, otherwise we may get an
         * exception between the new %fs descriptor being loaded and
-        * %fs being effectively cleared at __switch_to(). We can't
-        * just zero %gs, but we do need to clear the selector in
-        * case of a Xen vCPU context switch before it gets reloaded
-        * which would also cause a fault.
+        * %fs being effectively cleared at __switch_to().
+        *
+        * We may also need to zero %gs, if it refers to a descriptor
+        * which we are clearing. Otherwise a Xen vCPU context switch
+        * before it gets reloaded could also cause a fault. Since
+        * clearing the user %gs is another hypercall, do that only if
+        * it's necessary.
         */
        if (paravirt_get_lazy_mode() =3D=3D PARAVIRT_LAZY_CPU) {
 #ifdef CONFIG_X86_32
                lazy_load_gs(0);
 #else
-               struct multicall_space mc =3D __xen_mc_entry(0);
-               MULTI_set_segment_base(mc.mc, SEGBASE_GS_USER_SEL, 0);
+               savesegment(gs, flush_gs);
=20
                loadsegment(fs, 0);
 #endif
@@ -741,9 +752,9 @@ static void xen_load_tls(struct thread_struct *t, unsig=
ned int cpu)
=20
        xen_mc_batch();
=20
-       load_TLS_descriptor(t, cpu, 0);
-       load_TLS_descriptor(t, cpu, 1);
-       load_TLS_descriptor(t, cpu, 2);
+       load_TLS_descriptor(t, cpu, 0, flush_gs);
+       load_TLS_descriptor(t, cpu, 1, flush_gs);
+       load_TLS_descriptor(t, cpu, 2, flush_gs);
=20
        {
                struct multicall_space mc =3D __xen_mc_entry(0);

--=-qvO4m0s2WM5DThPhQaBQ
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
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xODEyMDcyMDA4NTRaMC8GCSqG
SIb3DQEJBDEiBCAv8QyTMrgA0Go5r+OXEJ7/pVmfcapljpvoIBeeRR13tjCBvQYJKwYBBAGCNxAE
MYGvMIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RP
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQTUYRMpPx2e52
jnkx1q87gDCBvwYLKoZIhvcNAQkQAgsxga+ggawwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBM
aW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2Vj
dXJlIEVtYWlsIENBAhBNRhEyk/HZ7naOeTHWrzuAMA0GCSqGSIb3DQEBAQUABIIBAAo6voXBzcy0
tcLv5sWX07kivfNyBODVKDU7F35dkoDGB/LgSptUbIWLQCInyVK2ONY3P1qCBHwEzJTUdD+sr1gH
q2QRBrCGpWLPGyrQCLY5uF4g6BvkXgFWWPf0TBdagJ1ZNNofp+Gg+HyYlGcpOCp0tUgOo2yDU7C7
BNIXgfG/2vh6WYVJpv8TIvrFHM+3i6l1TdjlLH9PlJt52Juqe0EVVu2CEwgppoYoQ+M95xNJ8jVH
/zNXNLMjBkiL2YNqsUMzYvb09wTDhcCZKhYWYkZLXE4L3tataX3/Xk41Bzz0G598bZdiTJoEce/O
sp89dZBqOMPWQ33sUBuiYukouAMAAAAAAAA=


--=-qvO4m0s2WM5DThPhQaBQ--



--===============2995606362934476694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2995606362934476694==--
