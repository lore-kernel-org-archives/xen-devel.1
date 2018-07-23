From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xenstore-client: Add option for raw
 in-/output
Date: Mon, 23 Jul 2018 12:10:13 +0200
Message-ID: <20180723101013.GG1371@mail-itl>
References: <20180721143537.2329-1-marmarek@invisiblethingslab.com>
 <20180723093905.crf63rc2ubah3ead@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7238442080142673559=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8pk4=kh=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fhXnI-0002tY-15
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 10:10:20 +0000
In-Reply-To: <20180723093905.crf63rc2ubah3ead@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============7238442080142673559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wFcEkHhPyqONlKAq"
Content-Disposition: inline


--wFcEkHhPyqONlKAq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 11:39:05AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sat, Jul 21, 2018 at 04:35:37PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > From: Simon Gaiser <simon@invisiblethingslab.com>
> >=20
> > Parsing/generating the escape sequences used by xenstore-client is non
> > trivial. So make scripting (for use in stubdom) easier by adding a raw
> > option.
>=20
> Should a description for this option be added to the man pages?

Yes, but I didn't found one for xenstore-read/xenstore-write. Where is
it?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--wFcEkHhPyqONlKAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltVqYUACgkQ24/THMrX
1yyRAwf9E5mRH1bGV27BZR0xUs4+cprXlbH4XqkiEbo2nsBXFuAIkEU8oMUPOfb9
RyAWr9eWaFO70s4b3qteGaHjPyIF/8rhfoHPvVgI2IuLjPVRc4D6WQaHuk4ZElOg
3a9eVkGmdyR4aj0pZ4Aa1Hg6wq3bZn2b7OOPlHHR5EoLDPRNdhNYw66Rx8QK4jR6
wubDaAjn+0nERFeLOc3gO0cIqQxNQU/3Fk84zirwU8xh0lmeZi4yO7Gp2znC3bKL
fqJBajSHv31e/PdQ66LEAGt6Ue6SQTxVCLgGsf1XBFCGyjwl2F29GQP/5TH++NnE
vI8z2X7ibPHpI2q8yBfkOBmvT4UYkw==
=VxET
-----END PGP SIGNATURE-----

--wFcEkHhPyqONlKAq--


--===============7238442080142673559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7238442080142673559==--
