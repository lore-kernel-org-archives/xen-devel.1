From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 11:55:13 -0600
Message-ID: <b1eee1f5-6715-9a83-6cd7-34f5de2ff3fd@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6462727071322556045=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2je3=ee=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eYy7J-00031t-8T
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:55:17 +0000
Received: by mail-yw0-x229.google.com with SMTP id y187so5977180ywd.12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 09:55:15 -0800 (PST)
In-Reply-To: <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>, Rich Persaud <persaur@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, committers@xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6462727071322556045==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="E4DoB5Yr2hRSRln6fhLzEKpcsiUXqPP2L"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E4DoB5Yr2hRSRln6fhLzEKpcsiUXqPP2L
Content-Type: multipart/mixed; boundary="SEkHqFxuCJ9aUVBskxeLGmYzk4Gpv9OvT";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Anthony Liguori <anthony@codemonkey.ws>, Rich Persaud <persaur@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, security@xenproject.org,
 Jan Beulich <JBeulich@suse.com>, committers@xenproject.org
Message-ID: <b1eee1f5-6715-9a83-6cd7-34f5de2ff3fd@cardoe.com>
Subject: Re: [Xen-devel] Radical proposal: ship not-fully-tidied shim as
 4.10.1
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>
In-Reply-To: <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>

--SEkHqFxuCJ9aUVBskxeLGmYzk4Gpv9OvT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/8/18 3:44 PM, Anthony Liguori wrote:
>=20
> It's not particularly hard to plumb through I think but if you are
> using PCI passthrough for PV, then you really shouldn't worry about
> Spectre/Meltdown.  That PV guest can already read all of physical
> memory (since no IOMMU is used) and they can also write to all
> physical memory which is far worse than what you can do with
> Spectre/Meltdown.
>=20

That's certainly not true. The IOMMU is used by default with PV if its
available since Xen 4.0.1. Prior to that there was an option that was
"iommu=3Dpv" which was not the default for 4.0.0. Its certainly possible
that's true for Xen 3.4 however.

--=20
Doug Goldstein


--SEkHqFxuCJ9aUVBskxeLGmYzk4Gpv9OvT--

--E4DoB5Yr2hRSRln6fhLzEKpcsiUXqPP2L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpVAgFfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3kqQ/9HCsCI3GyC4AVx24SDA9Wus2KnTUlYVdXjYusL66ilRYjeYpQD9vMq9KV
zylmIkf+x8tg7PQH4pifsEolzZX+C0wbCLOsgMSN4qf45/vNPtbrp7gCtktEH4yf
s5lfm0Rg6BknkqOqPhS6zvoEzs2eVvWbaVobhilBmY1XuReEDj+qr6hTeWqd6uHg
UcjWDQoZxGM8v3WhwhN8Y1g0gwOQ5O+jMbfgV5u7A8si/AHAWtUet2vea3t9c7Cl
OlBYVlEI6nOV/GjOJyy+TL1lmm5RcU6e8LaapDE8tyRfYbCScJamVudbvUPvtRSE
pp8SagfYvJOgLC6mCITRrDo9+cnkKABjAk+Egz9l42j1FBYtiq1+MiHAEFlHOvMa
ZrGv/gntyVVWrYfV0SNlkLiCw8QBsNtCJ3byVOIN6z/7RwFns5A/Jvz/uB0mW5m+
6E18rJVLnmwDFgzE/FaCfUo9Dv8lKSvOETdXsxW+ErjFjCJCM5ZBLdwqTjdF+g1v
/dtQCFHHJOgj22y42YnIPjTYAfW7npjZyyP5eJQ0bFXghnLT6mxQJKHCFYUiRtKd
kIyJY3IDvbmOW0L70mFru2CjMLUpirix1yYRG2oG3vKLdCQyE6wMjLcbQdDpyYaO
zE8wu/F4aoh025Q+3TGJ52EIsXM71ExFHpmkNmcP/CxXwnzn3lE=
=boXG
-----END PGP SIGNATURE-----

--E4DoB5Yr2hRSRln6fhLzEKpcsiUXqPP2L--


--===============6462727071322556045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6462727071322556045==--
