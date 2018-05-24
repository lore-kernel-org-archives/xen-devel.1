From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 14:35:00 +0000
Message-ID: <5c4aa655-093e-78c5-da3c-f06d24f2bb9d@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8491256936353226941=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLrLV-0006XV-Jf
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:36:01 +0000
In-Reply-To: <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8491256936353226941==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1fOHmFHfz0PV36a677P9INF68JSNejEos"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1fOHmFHfz0PV36a677P9INF68JSNejEos
Content-Type: multipart/mixed; boundary="AFMr54GIh1Boy9gYs47E0SXclNx6E9Rqp";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <5c4aa655-093e-78c5-da3c-f06d24f2bb9d@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
In-Reply-To: <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>

--AFMr54GIh1Boy9gYs47E0SXclNx6E9Rqp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 24/05/18 15:14, Simon Gaiser wrote:
>> Jan Beulich:
>>>>>> On 24.05.18 at 16:00, <simon@invisiblethingslab.com> wrote:
>>>> Jan Beulich:
>>>>> In commit d1d6fc97d6 ("x86/xpti: really hide almost all of Xen imag=
e")
>>>>> I've failed to remember the fact that multiple CPUs share a stub
>>>>> mapping page. Therefore it is wrong to unconditionally zap the mapp=
ing
>>>>> when bringing down a CPU; it may only be unmapped when no other onl=
ine
>>>>> CPU uses that same page.
>>>>>
>>>>> Reported-by: Simon Gaiser <simon@invisiblethingslab.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/arch/x86/smpboot.c
>>>>> +++ b/xen/arch/x86/smpboot.c
>>>>> @@ -876,7 +876,21 @@ static void cleanup_cpu_root_pgt(unsigne
>>>>> =20
>>>>>      free_xen_pagetable(rpt);
>>>>> =20
>>>>> -    /* Also zap the stub mapping for this CPU. */
>>>>> +    /*
>>>>> +     * Also zap the stub mapping for this CPU, if no other online =
one uses
>>>>> +     * the same page.
>>>>> +     */
>>>>> +    if ( stub_linear )
>>>>> +    {
>>>>> +        unsigned int other;
>>>>> +
>>>>> +        for_each_online_cpu(other)
>>>>> +            if ( !((per_cpu(stubs.addr, other) ^ stub_linear) >> P=
AGE_SHIFT) )
>>>>> +            {
>>>>> +                stub_linear =3D 0;
>>>>> +                break;
>>>>> +            }
>>>>> +    }
>>>>>      if ( stub_linear )
>>>>>      {
>>>>>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);
>>>> Tried this on-top of staging (fc5805daef) and I still get the same
>>>> double fault.
>>> Hmm, it worked for me offlining (and later re-onlining) several pCPU-=
s. What
>>> size a system are you testing on? Mine has got only 12 CPUs, i.e. all=
 stubs
>>> are in the same page (and I'd never unmap anything here at all).
>> 4 cores + HT, so 8 CPUs from Xen's PoV.
>=20
> Can you try with the "x86/traps: Dump the instruction stream even for
> double faults" patch I've just posted, and show the full #DF panic log
> please?  (Its conceivable that there are multiple different issues here=
=2E)

With Jan's and your patch:

(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, B=
CAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) emul-priv-op.c:1166:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1166:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1166:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1166:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1166:d0v3 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1166:d0v3 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1166:d0v4 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1166:d0v4 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) *** DOUBLE FAULT ***
(XEN) ----[ Xen-4.11-rc  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08037b964>] handle_exception+0x9c/0xff
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffffc90040ce40d8   rbx: 0000000000000000   rcx: 00000000000000=
03
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 000036ffbf31bf07   rsp: ffffc90040ce4000   r8:  00000000000000=
00
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040ce7f=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000426=
60
(XEN) cr3: 000000022200a000   cr2: ffffc90040ce3ff8
(XEN) fsb: 00007fa9e7909740   gsb: ffff88021e740000   gss: 00000000000000=
00
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08037b964> (handle_exception+0x9c/0xff):
(XEN)  00 f3 90 0f ae e8 eb f9 <e8> 07 00 00 00 f3 90 0f ae e8 eb f9 83 e=
9 01 75
(XEN) Current stack base ffffc90040ce0000 differs from expected ffff8300c=
ec88000
(XEN) Valid stack range: ffffc90040ce6000-ffffc90040ce8000, sp=3Dffffc900=
40ce4000, tss.rsp0=3Dffff8300cec8ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...


--AFMr54GIh1Boy9gYs47E0SXclNx6E9Rqp--

--1fOHmFHfz0PV36a677P9INF68JSNejEos
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsGzcYACgkQkO9xfO/x
ly/YKhAAkrRHbYzrLtU123J4VUHO7lUQwHcDlTsoi+Q5PTp8cTYwYdMUeo76irGM
g6OHA3U2kN252lAMiwUUDg9HChd4aKMb6BVsNSr77evQJU5rKI9KiEWU5XHFL03p
kT49RNBVFjJIXGl/j39ang+Q6dyUmNYkrjqsYj6iCZBYCmNyFvi3T74w0uggVZgq
lsd7AEETyJK2fDUvFvEnhs44q+rUhWV6l7OykjkM6DRUB1356GCTdVdA6ONhGQsc
8UB1Ig5jJPxY/ak0nNc3g1y6bPFZomoPmlmESEx1Mg33igkBxVr6wCc5A2QsxZ3n
da0+y0Wk3luNFk+kSB6X+ZTBxJNnE0vceY576RERzAcSDBHqiImYooA0PoDFDWq8
xGItWHDFA0b0EZ8+53shJ4knsby4VePlgKdISh5V3Wh15AZG4FxW5GPVa7WQsU9e
sBC+73Rr875m2wBV1zdzwmOA0pXirljDZ+OQDoCoTOtsR90teUuM6hFCCj4f/dXl
EMaIU0wWxdBFWLLGYxbibj6hKlDElJt/L3YwJ5rk0FO5FhiRU/HlWD/vW3cuDb02
1+jjX1shX/3eOVNDMQ1SYRO9lVJZCO6j4ad7GjjLXQivwncGxQkbNGQNqwLKjFgT
iISTqdOnjc0nEMPL09+TWaHCtLj4DCXsL2WnwNyfUKHwR0y0N8Y=
=44sL
-----END PGP SIGNATURE-----

--1fOHmFHfz0PV36a677P9INF68JSNejEos--


--===============8491256936353226941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8491256936353226941==--
