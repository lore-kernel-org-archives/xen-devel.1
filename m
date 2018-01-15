From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2] docs: note default for timer_mode in
	xl.cfg man
Date: Mon, 15 Jan 2018 14:28:31 -0600
Message-ID: <f102e1db-70ea-fcd9-5acc-e8893fb587bb@cardoe.com>
References: <20180115144551.5334-1-cardoe@cardoe.com>
 <20180115155910.kcw36xnkdk2laetc@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3507727118115266883=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=s3nm=ek=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ebBN4-0006KF-Uy
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 20:28:43 +0000
Received: by mail-yw0-x234.google.com with SMTP id m84so5899278ywd.5
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 12:28:40 -0800 (PST)
In-Reply-To: <20180115155910.kcw36xnkdk2laetc@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3507727118115266883==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ga8YTg9IzU7CaAaWLEfJu1UMUJz02sSHT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ga8YTg9IzU7CaAaWLEfJu1UMUJz02sSHT
Content-Type: multipart/mixed; boundary="5iY0ko88hZ8OI2dMUfF3BXE8nex4tqGgh";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>
Message-ID: <f102e1db-70ea-fcd9-5acc-e8893fb587bb@cardoe.com>
Subject: Re: [PATCH v2] docs: note default for timer_mode in xl.cfg man
References: <20180115144551.5334-1-cardoe@cardoe.com>
 <20180115155910.kcw36xnkdk2laetc@MacBook-Pro-de-Roger.local>
In-Reply-To: <20180115155910.kcw36xnkdk2laetc@MacBook-Pro-de-Roger.local>

--5iY0ko88hZ8OI2dMUfF3BXE8nex4tqGgh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/15/18 9:59 AM, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jan 15, 2018 at 08:45:51AM -0600, Doug Goldstein wrote:
>> There was no default documented but the header at
>> xen/include/public/hvm/params.h stated which the default was, so add i=
t
>> to the docs.
>=20
> While looking at libxl code I've found the following (it's at the end
> of libxl__domain_build_info_setdefault):
>=20
> /* Configuration fields shared between PVH and HVM. */
> if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV) {
>     if (libxl__timer_mode_is_default(&b_info->timer_mode))
>         b_info->timer_mode =3D LIBXL_TIMER_MODE_NO_DELAY_FOR_MISSED_TIC=
KS;
> ...
>=20
> Which means that in libxl the default timer mode is
> no_delay_for_missed_ticks instead of delay_for_missed_ticks, so I'm
> afraid you will have to fixup the xl.cfg change below.
>=20
> Thanks, Roger.
>=20

Well thank you for verifying this in the code instead of the headers
like I did. Follow up coming where I'll fix the header and the docs to
match the code.

--=20
Doug Goldstein


--5iY0ko88hZ8OI2dMUfF3BXE8nex4tqGgh--

--ga8YTg9IzU7CaAaWLEfJu1UMUJz02sSHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpdDvJfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3xBBAAqbWnlc3B4GFpLZvqTD8BWrcvMw6xanhdy+G0pzas7un1wvakhbfx9Sql
H9eHbOK/w6MGhO7ryoWO0LHw9+JLMRTzav+UTH+855NG057raNqte3i8LpLUtA3t
3Ye4+gQDwCS8JO0FhCPNJIANU/kNGgBr1Rmt6L/0tsmEB+InNfv8r7kWaQ0g0f8y
LUyJux/CwffJT/3fiHLs4F6rBl2bl+ZP5rWyFrzPM7AuL6b8AequFB/0vA7t99ZF
uzbFT0UBN8qeSgtErXcEMTvY/EzosEpnWbRViSPa3W/3+R7PSZCk9GOPJk4U42cD
CBJSS5phnbsDORGSE9tU8iCeBLRzY8OAYRHFvAuVAc88GjMBuyYntBfnpp8RqBmg
3CXnwJ16IKccXChAZsbcGnywoVP4EoJOIRv7Tbw/h8mOLc7o/NKVRbJ86j2aDID1
eorlY3l6O89ScNnrnVj/rjBVSh/yC1FM+pAbGc6nbvbJ4gkNlILM1bNuNu/d2iIY
rhP8qD5VpCG6exenVGPzyvPqE1rT9wWJP3ORjx6J7xVAdloS2qLLkU+uxO1FaOc4
LForDQNWt8PGK1uDpBcnqsfzRpyJNwI1MuEygbE9RCFhaoVLHO5sbxSV/u90NKk1
NQjSISyraCPN3U1R5Ctr0SdFlrvIxph7/yMULMGTt0edhaXpdik=
=A0pu
-----END PGP SIGNATURE-----

--ga8YTg9IzU7CaAaWLEfJu1UMUJz02sSHT--


--===============3507727118115266883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3507727118115266883==--
