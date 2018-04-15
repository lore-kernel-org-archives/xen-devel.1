From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
Date: Sun, 15 Apr 2018 15:52:00 +0000
Message-ID: <72e260c1-1804-1526-2b94-b7dda32313a3@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
 <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2714379288543057092=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ldgc=he=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f7jxf-00026P-VQ
 for xen-devel@lists.xenproject.org; Sun, 15 Apr 2018 15:53:04 +0000
In-Reply-To: <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2714379288543057092==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="K1KNLPA8EKNshvyZcA7P9yXsdv8oxj3ab"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--K1KNLPA8EKNshvyZcA7P9yXsdv8oxj3ab
Content-Type: multipart/mixed; boundary="IEvIbpSioKPYvPxhvh6MJpr1ObZp10bwi";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Message-ID: <72e260c1-1804-1526-2b94-b7dda32313a3@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
 <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
In-Reply-To: <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>

--IEvIbpSioKPYvPxhvh6MJpr1ObZp10bwi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 14/04/18 06:49, Simon Gaiser wrote:
>> Jan Beulich:
>>> 1: correct ordering of operations during S3 resume
>>> 2: suppress BTI mitigations around S3 suspend/resume
>>> 3: check feature flags after resume
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Simon, could you give this a try please?
>> Backported to 4.8 it works fine with the two fixes I sent earlier.
>>
>> I now also tried staging. Resume is broken even without IBRS/IBPB. It
>> panics about a double fault somewhere after it starts to enable the
>> non-boot CPUs. Since the IBRS/IPBP problem happens before that point I=

>> could test the patches anyway. With them it gets again to the point
>> where it double faults. So the patches are most likely fine.
>>
>> I didn't really looked yet at the cause of the double fault.
>=20
> Do you at least have the crash log from the attempt?

Sure, it' a build of 16fb4b5a9a79f95df17f10ba62e9f44d21cf89b5 on a
Debian sid:

(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, B=
CAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) *** DOUBLE FAULT ***
(XEN) ----[ Xen-4.11-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08037a944>] handle_exception+0x9c/0xf7
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffffc90040cd4068   rbx: 0000000000000000   rcx: 00000000000000=
0a
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 000036ffbf32bf77   rsp: ffffc90040cd4000   r8:  00000000000000=
00
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040cd7f=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000426=
e0
(XEN) cr3: 000000022200a000   cr2: ffffc90040cd3ff8
(XEN) fsb: 0000000000000000   gsb: ffff88021e6c0000   gss: 00000000000000=
00
(XEN) ds: 002b   es: 002b   fs: 8a00   gs: 0010   ss: e010   cs: e008
(XEN) Current stack base ffffc90040cd0000 differs from expected ffff8300c=
ec88000
(XEN) Valid stack range: ffffc90040cd6000-ffffc90040cd8000, sp=3Dffffc900=
40cd4000, tss.rsp0=3Dffff8300cec8ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...


--IEvIbpSioKPYvPxhvh6MJpr1ObZp10bwi--

--K1KNLPA8EKNshvyZcA7P9yXsdv8oxj3ab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrTdVYACgkQkO9xfO/x
ly9GgRAAzBIgp9TsdiCr5/Nmym9ahwX1cFPg5HPc+DEsuPXwlHkoLD8yhh8ZuiYo
ZID4sSB/AabS4FUPd2u0d1IRYAdO/gUAyhjkxAmGBiqNdOj+CQxcaATULWo8XY7o
ICvmX44kydW0eM5xO4Yut4rhjpCoZTDPsaBqQwTxGL9FMgEigbQ4BYl+l6Qu4oeM
ydJpuyeSY+cCuxwB0A8c3jxsNcY2cGtC6L/EHKwMa//liTAWnz1mHznB+ZQxorbL
h71bSlWK3In9tDwnwaV/v+Ml2xuhri614wJpHOCWyjep5KcwxC8y9xo3gZe2KUVs
vTk/mNvkub2HeKFW+FE5+Wy6Hg6q9UVFQjkLzTFzqEkFgql0mB2nBn4Gzu2Q1GiT
5iYs8d3Rfdq0YGpSfYVAdL2G8jfFxZodiyGSmSmVWvr+WMzF8zO5Hf2Ykb88a8HZ
pG3qijBLmJ/ON727oBPMlEi9ZnM01IyXFZarB13I/NijTP32dP5KcTJptUpIjE3v
dgeFDnBnAAdePwHkTeFd2V+Bk1+B2T6oNCFFZCci2Iy3+0HqeJUEak3PhnDCKMI1
BI7KWYyQswpI7QykLxlxCezd2h/sTAobPiyMDHN3Pvz/2PisV9g1tTv/UCBNOQEM
p5iGgrEs1gEbLE4u34PXXMCZ86AedjnjcnOKvvolxsIIKVKON9s=
=fNot
-----END PGP SIGNATURE-----

--K1KNLPA8EKNshvyZcA7P9yXsdv8oxj3ab--


--===============2714379288543057092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2714379288543057092==--
