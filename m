From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 14:14:00 +0000
Message-ID: <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2998652039746993675=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLr1C-0003iY-MC
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:15:02 +0000
In-Reply-To: <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
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
--===============2998652039746993675==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="2YkzMPJbHfKAdqs36U8Ldo3pnYYkdBRsd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2YkzMPJbHfKAdqs36U8Ldo3pnYYkdBRsd
Content-Type: multipart/mixed; boundary="5G3UJr0QEXy07uzhyi6AvHePEj8k2xwzV";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Message-ID: <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
In-Reply-To: <5B06C76402000078001C5983@prv1-mh.provo.novell.com>

--5G3UJr0QEXy07uzhyi6AvHePEj8k2xwzV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
>>>> On 24.05.18 at 16:00, <simon@invisiblethingslab.com> wrote:
>> Jan Beulich:
>>> In commit d1d6fc97d6 ("x86/xpti: really hide almost all of Xen image"=
)
>>> I've failed to remember the fact that multiple CPUs share a stub
>>> mapping page. Therefore it is wrong to unconditionally zap the mappin=
g
>>> when bringing down a CPU; it may only be unmapped when no other onlin=
e
>>> CPU uses that same page.
>>>
>>> Reported-by: Simon Gaiser <simon@invisiblethingslab.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -876,7 +876,21 @@ static void cleanup_cpu_root_pgt(unsigne
>>> =20
>>>      free_xen_pagetable(rpt);
>>> =20
>>> -    /* Also zap the stub mapping for this CPU. */
>>> +    /*
>>> +     * Also zap the stub mapping for this CPU, if no other online on=
e uses
>>> +     * the same page.
>>> +     */
>>> +    if ( stub_linear )
>>> +    {
>>> +        unsigned int other;
>>> +
>>> +        for_each_online_cpu(other)
>>> +            if ( !((per_cpu(stubs.addr, other) ^ stub_linear) >> PAG=
E_SHIFT) )
>>> +            {
>>> +                stub_linear =3D 0;
>>> +                break;
>>> +            }
>>> +    }
>>>      if ( stub_linear )
>>>      {
>>>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);
>>
>> Tried this on-top of staging (fc5805daef) and I still get the same
>> double fault.
>=20
> Hmm, it worked for me offlining (and later re-onlining) several pCPU-s.=
 What
> size a system are you testing on? Mine has got only 12 CPUs, i.e. all s=
tubs
> are in the same page (and I'd never unmap anything here at all).

4 cores + HT, so 8 CPUs from Xen's PoV.


--5G3UJr0QEXy07uzhyi6AvHePEj8k2xwzV--

--2YkzMPJbHfKAdqs36U8Ldo3pnYYkdBRsd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsGyNsACgkQkO9xfO/x
ly9Egg/+Odj/F9qqmest30eYctnVvXVy/HI8kbVnVHmXBj6XiHq3KVEGtvdN30fz
1E9ekDHnpQQu8uI66O3WQxEUVnNMELkuzQ0F0QJtyRAbMoutd7PTVqeUYOdfv6YQ
6R31OIjKuBs87yfJbXpQNW7mZ8Af1X05lU8EIK0ftCaaJkaMWNxDCHqbM4Gx+bB8
sW34aLHKHLGl4Diya9OHWBx70yfwI2Fxs0kRLQUQEpxI+0eZuxs/IQKq1IpjCRSy
iz3GOoC3vp2AfCp94iCgu1a91647FPB8ILGAa4BUTzrHrrHM9kDFxwGEWHyv0WxF
xyYXpUN1j6JE96ey7ydkBT0+AzOfFIgjrPey95AY7BUXQeHwRpkHGay9/AXAo6FG
QTS9JeKe1k/oRX//AQZrZO3TwdwWnDMiuObKQIrXbyoB4YG6oeSEHiDtdzWeWCzY
ZUm+AIblW7UXHrQaRfDLY5HViaeydqi3iixqh4dMn+iIzkuBNdOuOLMZV75xcix3
KteoTTzoerYoc0C400FdoaGTZJSflQna+UyF3n4clzoYRdKYPKtYGBsillXU0tHz
xmlt2PK9i/n2NH9j3zVIA3TgtYHpcxyfYmwC+hY3eW8R8xdlQBuuBLfYrYUq6vEZ
WK/J7LU6a5n7/I/rgYOU8xxgrwhiAZsY111i+44RtdKARRuo77Y=
=hrQ9
-----END PGP SIGNATURE-----

--2YkzMPJbHfKAdqs36U8Ldo3pnYYkdBRsd--


--===============2998652039746993675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2998652039746993675==--
