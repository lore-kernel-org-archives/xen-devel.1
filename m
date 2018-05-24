From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 14:00:00 +0000
Message-ID: <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7849888585820055712=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLqnT-0002C1-BE
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:00:51 +0000
In-Reply-To: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7849888585820055712==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="f9bw0nwiSfHyKuqTf3Gjoang5OXojMF6e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f9bw0nwiSfHyKuqTf3Gjoang5OXojMF6e
Content-Type: multipart/mixed; boundary="dp0TekvS7jIByBlb3oGFdsHTBAvt3qf6q";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
In-Reply-To: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>

--dp0TekvS7jIByBlb3oGFdsHTBAvt3qf6q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> In commit d1d6fc97d6 ("x86/xpti: really hide almost all of Xen image")
> I've failed to remember the fact that multiple CPUs share a stub
> mapping page. Therefore it is wrong to unconditionally zap the mapping
> when bringing down a CPU; it may only be unmapped when no other online
> CPU uses that same page.
>=20
> Reported-by: Simon Gaiser <simon@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -876,7 +876,21 @@ static void cleanup_cpu_root_pgt(unsigne
> =20
>      free_xen_pagetable(rpt);
> =20
> -    /* Also zap the stub mapping for this CPU. */
> +    /*
> +     * Also zap the stub mapping for this CPU, if no other online one =
uses
> +     * the same page.
> +     */
> +    if ( stub_linear )
> +    {
> +        unsigned int other;
> +
> +        for_each_online_cpu(other)
> +            if ( !((per_cpu(stubs.addr, other) ^ stub_linear) >> PAGE_=
SHIFT) )
> +            {
> +                stub_linear =3D 0;
> +                break;
> +            }
> +    }
>      if ( stub_linear )
>      {
>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);

Tried this on-top of staging (fc5805daef) and I still get the same
double fault.


--dp0TekvS7jIByBlb3oGFdsHTBAvt3qf6q--

--f9bw0nwiSfHyKuqTf3Gjoang5OXojMF6e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsGxYYACgkQkO9xfO/x
ly+J/RAArn4Wo4THh16dn6pJypGSnhem5HkpgM5H1aBOinK65cR0QuE9RnnBp3Lb
I/KqsEXqU3+ZzBCuNeZ15bcvQoIKU0v7gVx850nNKsTt5wibXcVlzoXKHlos7eGl
s+TUFB3bEzi/VNGxAu4JtRiSwgEHjMdVWFEw3eUoS7517TEPqzb7vqWVWZwds7lF
3Dfrc6tj1RgNXAtOZYA+H7/5NADNU1Gi8pC7bIrnOaZyqvhPyqGT/KSLXd13C0dZ
J0QFP/GFl0loFTXJTXoq1YUXOwGJvffJL4CGVYQdPhwYVFgj3Z0CY+23UZQoNj2r
bA8vFmY0PSg7xegmmwS15tnaat/s/H4Hwdc6zOUKcSJMxPFLil5uEFBviiZs2dax
DIWC6jVSUIZQVosjedgtHqsKgVasmk+aJXeanVTsFZs0wzatjtByORvEVfwF7RhR
466Zs1KYL3CjXB4UuhSLRPCim2dUfYlnnbbaDvXAZF8AuwBXAX+oxB6u4RqApQkl
xUd56RoayeAcxrjvyfA6v7vk5YaDeO6sGjqFLHH53gJ2YdK1kS1Ae3K/fwWuFcld
DYrtiB9kLIPvBhcjuBeGkyZxtk0ZHRVjla9gq7+qKcE6LF/+0UUJbHsoDA/IuVO/
S5weHDZEOp+D7z1l4qU59zCRvNjuC4lb4oiGjI7VakTjxkVz7FQ=
=Tnnt
-----END PGP SIGNATURE-----

--f9bw0nwiSfHyKuqTf3Gjoang5OXojMF6e--


--===============7849888585820055712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7849888585820055712==--
