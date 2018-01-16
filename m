From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Rudolph: merging Vixen and Comet
Date: Tue, 16 Jan 2018 10:42:17 -0600
Message-ID: <808b6de4-be69-4a4c-1cd3-40b6dc8a5bde@cardoe.com>
References: <20180112132409.4d4fn6mbprgm7vhg@citrix.com>
 <20180112141704.GC16260@aepfle.de>
 <20180112142030.puipf25gp2fooaxe@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5730787383855562524=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=y/8d=el=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ebUJf-000719-Il
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 16:42:27 +0000
Received: by mail-yw0-x244.google.com with SMTP id u21so7033347ywc.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 08:42:25 -0800 (PST)
In-Reply-To: <20180112142030.puipf25gp2fooaxe@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, jschoenh@amazon.de, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5730787383855562524==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZPSXp31pp1W2dAR2d2OmfldD562YF16WW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZPSXp31pp1W2dAR2d2OmfldD562YF16WW
Content-Type: multipart/mixed; boundary="be9DHN2QGTo0NE1QnfEuvsdd4JbizoElS";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 jschoenh@amazon.de, Anthony Liguori <aliguori@amazon.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <808b6de4-be69-4a4c-1cd3-40b6dc8a5bde@cardoe.com>
Subject: Re: [Xen-devel] Rudolph: merging Vixen and Comet
References: <20180112132409.4d4fn6mbprgm7vhg@citrix.com>
 <20180112141704.GC16260@aepfle.de>
 <20180112142030.puipf25gp2fooaxe@citrix.com>
In-Reply-To: <20180112142030.puipf25gp2fooaxe@citrix.com>

--be9DHN2QGTo0NE1QnfEuvsdd4JbizoElS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/12/18 8:20 AM, Wei Liu wrote:
> On Fri, Jan 12, 2018 at 03:17:04PM +0100, Olaf Hering wrote:
>> On Fri, Jan 12, Wei Liu wrote:
>>
>>>                       Vixen                          Comet
>>> Guest console         Output only                    Bi-directional
>>
>> With the proper patch input works for Vixen. Unless this item mean
>> something else.
>=20
> Vixen means the version upstream put into the advisory. The patch you
> talked about is not provided in that branch.
>=20
> Wei.
>=20

Can we merge some fixes people have proposed into the Vixen branch?
There are a number of virtualization providers that have rolled forward
with Vixen. They are clearly contributing patches on the ML and having
one place to work together would be nice.

We can always host a fork on GitHub and merge patches there as well if
that's preferred.

--=20
Doug Goldstein


--be9DHN2QGTo0NE1QnfEuvsdd4JbizoElS--

--ZPSXp31pp1W2dAR2d2OmfldD562YF16WW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpeK2lfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1HcA//QOfI5+8TlHESO2Mn8DWlTR8jjfVykgfqaLJhHl+yIKBiN0v0ZFD0Mxk9
3EXyL6yyMLNZRXs02MEfmAZzClINN8jUTNFEHZr1uwHOXqCyeMJ608jd6eqbuC3f
9kT/UwCYquPO6gPDMM2w5CFj8sDuUj3rgiC+SqcQkn/KBDOEW73DlzHLyscwxwGG
pM9O5GzaplUlw138emF4x7MDHIS/UsO9iK0lr+b5GgeTBNY8anyZXdfWBA505jh/
IW9fvcRlYX9qlxL3g0pONWZguLaFQrZBkagmJ57tHMhnvv6KBKb4agwsm/GvGjdk
3tIoiN1Bu5DC2aRAEY0/SU4s6Q35GMrd5JtkZHVTkqp/9pa2Jl6Wjn7KjEts00II
Igl3lMl1p383c2syy7+a2hSM/SrT/HBWQlCZwlnRGMprDFGbmCpUBc9nNtuEJBg5
fgQgPNYurUPxfzRSa2CP4ynjqxLN2N633jN2sKKxtAMq+7MF1C/YiAH4sdHJnCcP
hxNUvKxhGfo9X9DeGM9bN38YhqnRGYYu0Zk53VVdPHT4l1CEMGJImqxLg+nfyrjb
I9UvIRRhCjxTXFOpKrhecBjTckirizq+G8mq9v4vGLe4lyZIpNIbVYFos8zlXvWW
AbHvgEhQ/hr0B8W7XFB0jcGdMysir4kSZ+YhZpzUyA1ovVPalYo=
=cKvx
-----END PGP SIGNATURE-----

--ZPSXp31pp1W2dAR2d2OmfldD562YF16WW--


--===============5730787383855562524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5730787383855562524==--
