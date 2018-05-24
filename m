From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 16:12:00 +0000
Message-ID: <7323393c-9ade-3ab9-3d6e-a38be2f68ed0@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>
 <9ad3d985-58a3-085b-f898-d1079dee4e37@invisiblethingslab.com>
 <5B06DE6602000078001C5ACC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7335573197534090342=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLsr2-0001n5-6c
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:12:40 +0000
In-Reply-To: <5B06DE6602000078001C5ACC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7335573197534090342==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="07Fpqz6KjUHP22R6LuWMBLJuT0jGjJ0y2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--07Fpqz6KjUHP22R6LuWMBLJuT0jGjJ0y2
Content-Type: multipart/mixed; boundary="vMvfYyqGFFR5uxHuRig1pKqvz0nojt9yk";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Message-ID: <7323393c-9ade-3ab9-3d6e-a38be2f68ed0@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>
 <9ad3d985-58a3-085b-f898-d1079dee4e37@invisiblethingslab.com>
 <5B06DE6602000078001C5ACC@prv1-mh.provo.novell.com>
In-Reply-To: <5B06DE6602000078001C5ACC@prv1-mh.provo.novell.com>

--vMvfYyqGFFR5uxHuRig1pKqvz0nojt9yk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
>>>> On 24.05.18 at 17:10, <simon@invisiblethingslab.com> wrote:
>> Jan Beulich:
>>>>>> On 24.05.18 at 16:14, <simon@invisiblethingslab.com> wrote:
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
 PAGE_SHIFT)=20
>> )
>>>>>>> +            {
>>>>>>> +                stub_linear =3D 0;
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +    }
>>>>>>>      if ( stub_linear )
>>>>>>>      {
>>>>>>>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);
>>>>>>
>>>>>> Tried this on-top of staging (fc5805daef) and I still get the same=

>>>>>> double fault.
>>>>>
>>>>> Hmm, it worked for me offlining (and later re-onlining) several pCP=
U-s. What
>>>>> size a system are you testing on? Mine has got only 12 CPUs, i.e. a=
ll stubs
>>>>> are in the same page (and I'd never unmap anything here at all).
>>>>
>>>> 4 cores + HT, so 8 CPUs from Xen's PoV.
>>>
>>> May I ask you to do two things:
>>> 1) confirm that you can offline CPUs successfully using xen-hptool,
>>> 2) add a printk() to the code above making clear whether/when any
>>> of the mappings actually get zapped?
>>
>> There seem to be two failure modes now. It seems that both can be
>> triggered either by offlining a cpu or by suspend. Using cpu offlining=

>> below since during suspend I often loose part of the serial output.
>>
>> Failure mode 1, the double fault as before:
>>
>> root@localhost:~# xen-hptool cpu-offline 3
>> Prepare to offline CPU 3
>> (XEN) Broke affinity for irq 9
>> (XEN) Broke affinity for irq 29
>> (XEN) dbg: stub_linear't1 =3D 18446606431818858880
>> (XEN) dbg: first stub_linear if
>> (XEN) dbg: stub_linear't2 =3D 18446606431818858880
>> (XEN) dbg: second stub_linear if
>> CPU 3 offlined successfully
>> root@localhost:~# (XEN) *** DOUBLE FAULT ***
>> (XEN) ----[ Xen-4.11-rc  x86_64  debug=3Dy   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d08037b964>] handle_exception+0x9c/0xff
>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
>> (XEN) rax: ffffc90040cdc0a8   rbx: 0000000000000000   rcx: 00000000000=
00006
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000=
00000
>> (XEN) rbp: 000036ffbf323f37   rsp: ffffc90040cdc000   r8:  00000000000=
00000
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000=
00000
>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040c=
dffff
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000=
42660
>> (XEN) cr3: 0000000128109000   cr2: ffffc90040cdbff8
>> (XEN) fsb: 00007fc01c3c6dc0   gsb: ffff88021e700000   gss: 00000000000=
00000
>> (XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d08037b964> (handle_exception+0x9c/0xff):=

>> (XEN)  00 f3 90 0f ae e8 eb f9 <e8> 07 00 00 00 f3 90 0f ae e8 eb f9 8=
3 e9 01=20
>> 75
>> (XEN) Current stack base ffffc90040cd8000 differs from expected=20
>> ffff8300cec88000
>> (XEN) Valid stack range: ffffc90040cde000-ffffc90040ce0000,=20
>> sp=3Dffffc90040cdc000, tss.rsp0=3Dffff8300cec8ffa0
>> (XEN) No stack overflow detected. Skipping stack trace.
>> (XEN)=20
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) DOUBLE FAULT -- system shutdown
>> (XEN) ****************************************
>> (XEN)=20
>> (XEN) Reboot in five seconds...
>=20
> Oh, so CPU 0 gets screwed by offlining CPU 3. How about this alternativ=
e
> (but so far untested) patch:
>=20
> --- unstable.orig/xen/arch/x86/smpboot.c
> +++ unstable/xen/arch/x86/smpboot.c
> @@ -874,7 +874,7 @@ static void cleanup_cpu_root_pgt(unsigne
>          l2_pgentry_t *l2t =3D l3e_to_l2e(l3t[l3_table_offset(stub_line=
ar)]);
>          l1_pgentry_t *l1t =3D l2e_to_l1e(l2t[l2_table_offset(stub_line=
ar)]);
> =20
> -        l1t[l2_table_offset(stub_linear)] =3D l1e_empty();
> +        l1t[l1_table_offset(stub_linear)] =3D l1e_empty();
>      }
>  }
> =20

Yes, this fixes cpu on-/offlining and suspend for me on staging.


--vMvfYyqGFFR5uxHuRig1pKqvz0nojt9yk--

--07Fpqz6KjUHP22R6LuWMBLJuT0jGjJ0y2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsG5GkACgkQkO9xfO/x
ly9qyhAAsBjdVB8Uykh/DjqiZhZ6gR1i8MhiqqGyrhd28IujU3p21FayW5X3KJvu
Rbu8NQuEGCT8umrRaE79ZqAvK04snQLHmOlIfgmVMbQQiA2uLtEXSIZ+LnnR5dNz
R8W28/b41labfAb9c2CcZAKytoD2EHk2Ib3rC0g7hH8OGlply15/cXKQSW6JFlid
geRvUePPAqI+r9mFxOmxsSkFtu32cfIWbwSBaGRDzrI7vKWXHqQdAxCNDC3k1kHX
L5pmUYCEJQLsItbr9CdGLNRTNY18Cjp+eaGgDsRU/7Yzb0h/pXX4NqQyba8LgCmZ
SqwWfQvjZb5Lwt52uCQmNNy8ZgkN5IyQuIsRaTTjtt7XNjJnzI2/ABmySKK5pj0D
s8nmD6gYks6Wgnt8vb2QTTX4XkhQ95Qyttpt4JLuxJctQ7oJnVMKY+lpX5B1hhVw
L3kVPxc38wNYfuq+zcu4Njb+R4rXfHzmIzYNhJBscpQXdfKB7ZBgEToEcu6yR1Jr
5y2Kgc68kj+MMU/CDHnDztRqrPs3vn+nkPeV+4t48MpgVTCd6kBfH9t3Z1b6s6gF
zlt7a6kY+e90R/w9ofiuQrQ9+AvRPSd859KJVm9av2/V191VZ562SW/f8kcNCkQe
KXspydlMYZW4i8idi9wBZj/dw/6JrQBk8vWq4Eoiw1JDWOKnEEI=
=mA4F
-----END PGP SIGNATURE-----

--07Fpqz6KjUHP22R6LuWMBLJuT0jGjJ0y2--


--===============7335573197534090342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7335573197534090342==--
