From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 15:16:00 +0000
Message-ID: <3cb7145c-4198-f4ae-b7f2-8431f4ac764a@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
 <5c4aa655-093e-78c5-da3c-f06d24f2bb9d@invisiblethingslab.com>
 <c33bc3d2-2d8e-436a-a236-53e0a3bde8a2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0763322188363244780=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLrzG-0002Rm-DC
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 15:17:06 +0000
In-Reply-To: <c33bc3d2-2d8e-436a-a236-53e0a3bde8a2@citrix.com>
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
--===============0763322188363244780==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="R1JhZX2AL70Uld7gbEotOLxqEzGbzJ67O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R1JhZX2AL70Uld7gbEotOLxqEzGbzJ67O
Content-Type: multipart/mixed; boundary="1koeIN9snHOVZ4snAndB2At4vqNuyKMVH";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <3cb7145c-4198-f4ae-b7f2-8431f4ac764a@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
 <5c4aa655-093e-78c5-da3c-f06d24f2bb9d@invisiblethingslab.com>
 <c33bc3d2-2d8e-436a-a236-53e0a3bde8a2@citrix.com>
In-Reply-To: <c33bc3d2-2d8e-436a-a236-53e0a3bde8a2@citrix.com>

--1koeIN9snHOVZ4snAndB2At4vqNuyKMVH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 24/05/18 15:35, Simon Gaiser wrote:
>> Andrew Cooper:
>>> On 24/05/18 15:14, Simon Gaiser wrote:
>>>> Jan Beulich:
>>>>>>>> On 24.05.18 at 16:00, <simon@invisiblethingslab.com> wrote:
>>>>>> Jan Beulich:
>>>>>>> In commit d1d6fc97d6 ("x86/xpti: really hide almost all of Xen im=
age")
>>>>>>> I've failed to remember the fact that multiple CPUs share a stub
>>>>>>> mapping page. Therefore it is wrong to unconditionally zap the ma=
pping
>>>>>>> when bringing down a CPU; it may only be unmapped when no other o=
nline
>>>>>>> CPU uses that same page.
>>>>>>>
>>>>>>> Reported-by: Simon Gaiser <simon@invisiblethingslab.com>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> --- a/xen/arch/x86/smpboot.c
>>>>>>> +++ b/xen/arch/x86/smpboot.c
>>>>>>> @@ -876,7 +876,21 @@ static void cleanup_cpu_root_pgt(unsigne
>>>>>>> =20
>>>>>>>      free_xen_pagetable(rpt);
>>>>>>> =20
>>>>>>> -    /* Also zap the stub mapping for this CPU. */
>>>>>>> +    /*
>>>>>>> +     * Also zap the stub mapping for this CPU, if no other onlin=
e one uses
>>>>>>> +     * the same page.
>>>>>>> +     */
>>>>>>> +    if ( stub_linear )
>>>>>>> +    {
>>>>>>> +        unsigned int other;
>>>>>>> +
>>>>>>> +        for_each_online_cpu(other)
>>>>>>> +            if ( !((per_cpu(stubs.addr, other) ^ stub_linear) >>=
 PAGE_SHIFT) )
>>>>>>> +            {
>>>>>>> +                stub_linear =3D 0;
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +    }
>>>>>>>      if ( stub_linear )
>>>>>>>      {
>>>>>>>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);
>>>>>> Tried this on-top of staging (fc5805daef) and I still get the same=

>>>>>> double fault.
>>>>> Hmm, it worked for me offlining (and later re-onlining) several pCP=
U-s. What
>>>>> size a system are you testing on? Mine has got only 12 CPUs, i.e. a=
ll stubs
>>>>> are in the same page (and I'd never unmap anything here at all).
>>>> 4 cores + HT, so 8 CPUs from Xen's PoV.
>>> Can you try with the "x86/traps: Dump the instruction stream even for=

>>> double faults" patch I've just posted, and show the full #DF panic lo=
g
>>> please?  (Its conceivable that there are multiple different issues he=
re.)
>> With Jan's and your patch:
>>
>> (XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0=
, BCAST, CMCI
>> (XEN) CPU0 CMCI LVT vector (0xf2) already installed
>> (XEN) Finishing wakeup from ACPI S3 state.
>> (XEN) Enabling non-boot CPUs  ...
>> (XEN) emul-priv-op.c:1166:d0v1 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1166:d0v1 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>> (XEN) emul-priv-op.c:1166:d0v2 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1166:d0v2 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>> (XEN) emul-priv-op.c:1166:d0v3 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1166:d0v3 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>> (XEN) emul-priv-op.c:1166:d0v4 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1166:d0v4 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>=20
> /sigh - Naughty Linux.  The PVOps really ought to know that they don't
> have an APIC to play with, not that this related to the crash.
>=20
>> (XEN) *** DOUBLE FAULT ***
>> (XEN) ----[ Xen-4.11-rc  x86_64  debug=3Dy   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d08037b964>] handle_exception+0x9c/0xff
>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
>> (XEN) rax: ffffc90040ce40d8   rbx: 0000000000000000   rcx: 00000000000=
00003
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000=
00000
>> (XEN) rbp: 000036ffbf31bf07   rsp: ffffc90040ce4000   r8:  00000000000=
00000
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000=
00000
>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040c=
e7fff
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000=
42660
>> (XEN) cr3: 000000022200a000   cr2: ffffc90040ce3ff8
>> (XEN) fsb: 00007fa9e7909740   gsb: ffff88021e740000   gss: 00000000000=
00000
>> (XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d08037b964> (handle_exception+0x9c/0xff):=

>> (XEN)  00 f3 90 0f ae e8 eb f9 <e8> 07 00 00 00 f3 90 0f ae e8 eb f9 8=
3 e9 01 75
>> (XEN) Current stack base ffffc90040ce0000 differs from expected ffff83=
00cec88000
>> (XEN) Valid stack range: ffffc90040ce6000-ffffc90040ce8000, sp=3Dffffc=
90040ce4000, tss.rsp0=3Dffff8300cec8ffa0
>> (XEN) No stack overflow detected. Skipping stack trace.
>=20
> Ok - this is the same as George's crash, and yes - I did misdiagnose th=
e
> stack we were on.  I presume this hardware doesn't have SMAP? (or we've=

> expected to take a #DF immediately at the head of the syscall hander.)

Yes, it's too old for SMAP. It's a i7-2760QM.


--1koeIN9snHOVZ4snAndB2At4vqNuyKMVH--

--R1JhZX2AL70Uld7gbEotOLxqEzGbzJ67O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsG12QACgkQkO9xfO/x
ly9bwxAAnWQOK7EnMqJkwhDhp0tQzvK8SALH/1NNFV4CWrShHWqTNiGdcpK9MS6k
p6+E9+pMELSHaVMxC3wGlPtBqA0FEI968NOc16LipprFbTciX21K63koZb0qFisU
V1p28n5NdvNT1wZYbNTRzX+5/fpCMqHbdOVT6M++d/i/VVXmIyLFrF4fR7WtgiLk
MRMqDnjpS8xsNscTzYACt/8X1+1ZtiVKdLyjXN7o5xQf27fBV+vxnpGfn8dFLiUf
F2WCkMIXzSWXO5J4UagrX2hZGrr6jhFX/jx6YRC8Xlm7pMKm9veDd74ubs3l7TTF
eMiDcRxsntOUrWhy5S0eEJQu2+CqLbHghRYR74cU70D0Kj9fiHa6N9SZjbZCC97i
RuUOGC5+8cthR7dlaP474lspRE94n0FG2oJnV+YywJknID6pkw+NmVNTcPAWvl1a
Ay091k++pSHXsb8VQmDvfjYU6EKTzFVQE3rt1ONutwDYx9bgz5wTWPNyR+5Q0nA/
1Zny+LWmUVfxGyi7cAfEpVal5rHBv3RrEiCCEOJrZl/Z6wZKGauml80y/4eLSj3v
vJAIukGbgtOpZ3Z2NKiUmxMX1Dn46U+as/vmE2UpHiInQg3crqHld9FeGHzxN98g
QHpEcGVNuLaq/6/fPE3fA4EJLbnwqS4HX5nqeYt0w6aPrM9Di+w=
=mfIj
-----END PGP SIGNATURE-----

--R1JhZX2AL70Uld7gbEotOLxqEzGbzJ67O--


--===============0763322188363244780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0763322188363244780==--
