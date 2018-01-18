From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2] x86/efi: fix build with linkers that
 support both coff-x86-64 and pe-x86-64
Date: Thu, 18 Jan 2018 10:21:12 -0600
Message-ID: <63395d03-fab6-055c-d5ef-e3a848971f33@cardoe.com>
References: <20180117125641.35927-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5842530774962316506=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zhje=en=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ecCwN-0002gF-AH
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 16:21:23 +0000
Received: by mail-yw0-x234.google.com with SMTP id q26so11664957ywa.6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 08:21:21 -0800 (PST)
In-Reply-To: <20180117125641.35927-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5842530774962316506==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FjwvDrPuIs5wDi5vSM0uobRjxK6xJI8kC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FjwvDrPuIs5wDi5vSM0uobRjxK6xJI8kC
Content-Type: multipart/mixed; boundary="DCEFn12TSwU2s5IcbS7z6vHSGunTjvOOn";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <63395d03-fab6-055c-d5ef-e3a848971f33@cardoe.com>
Subject: Re: [PATCH v2] x86/efi: fix build with linkers that support both
 coff-x86-64 and pe-x86-64
References: <20180117125641.35927-1-roger.pau@citrix.com>
In-Reply-To: <20180117125641.35927-1-roger.pau@citrix.com>

--DCEFn12TSwU2s5IcbS7z6vHSGunTjvOOn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/17/18 6:56 AM, Roger Pau Monne wrote:
> When using a linker that supports both formats the following error
> will be triggered:
>=20
> efi/buildid.o: file not recognized: File format is ambiguous
> efi/buildid.o: matching formats: coff-x86-64 pe-x86-64
>=20
> Solve this by specifying the efi/buildid.o format to pe-x86-64.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
--=20
Doug Goldstein


--DCEFn12TSwU2s5IcbS7z6vHSGunTjvOOn--

--FjwvDrPuIs5wDi5vSM0uobRjxK6xJI8kC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpgyXhfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3YKRAAvVHkCTMqsFcihUao/YcJK5Yzqqgd5nUpvbvt+hfArJDimBuNwI4t57M5
U/TkvtyDZ13iTleAQ/pitnkWBTieZvswt6ccli9/F4y3pSGRpMf8sADbRxqV+ZC1
qwkH93itVq7QepNND0dhZWXjwhbUiqXa0/OXrhOihLH8YPP9xnHsB8DngEUI3rJs
ONmgZZ3n3qD8lZ6FN5lEZThnI+PehVz8zbWAhyeSAJx0P0MaG3UTvNHft3UgGSWO
TIzts4OYTayPfIBH8P8LaKWDMkpUxLQXBW0Y78Lkjt9EkolulR6kClkJwRf9M3Qh
WYjZH8+W2HEdZSUxA0NLXICE0b1msoqUppHvvpdlcmh6OPF/eSCq6Hm8TONgVDeh
KosMu63pirbMjlH346/lrB2ixnfcR6UBy7QdKUcy6Zx+sQ4ml85s/fhNwgzH8EVB
WSVhT8Xgr3OLe4kVGXhAFFWQlUebA85zW7RE9zKWVJmEbS8GCfA3vUdKefHQELz/
SZYEbkkKUQU37yLk1gFYTfRUEVUongtXxQkGyDmgGAHIlCfjygf6fwTvJoNuJtv4
prCVY1LZ4wTp/q5+gEYGTUoazrUjzvHuHIqh1F2R3EADdUXfGhKDvwLMZwztKZjG
x6L3p1wVhMO2jo73Q/yjeAqWXhkyjqvkH+fGLn0enF1t+LrHwRA=
=GpIk
-----END PGP SIGNATURE-----

--FjwvDrPuIs5wDi5vSM0uobRjxK6xJI8kC--


--===============5842530774962316506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5842530774962316506==--
