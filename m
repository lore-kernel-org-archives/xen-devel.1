From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] libxl: allow libxl_domain_suspend to
 simply suspend a domain, without saving it
Date: Wed, 4 Apr 2018 17:53:02 +0200
Message-ID: <20180404155302.GE3176@mail-itl>
References: <20180314143608.22615-1-marmarek@invisiblethingslab.com>
 <20180321165210.b5b6xw2y5ogumhil@citrix.com>
 <23227.31353.516795.789410@mariner.uk.xensource.com>
 <20180404154217.GC5817@mail-itl>
 <23236.62255.704543.993528@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3450598356861639266=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23236.62255.704543.993528@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Marcus of Wetware Labs <marcus@wetwa.re>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============3450598356861639266==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2018 at 04:45:51PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [PATCH v2] libxl: allow libx=
l_domain_suspend to simply suspend a domain, without saving it"):
> > On Wed, Mar 28, 2018 at 12:20:25PM +0100, Ian Jackson wrote:
> > > I agree that libxl_domain_suspend is an unfortunate name, but can't we
> > > come up with an alternative new name ?  It does seem odd to bundle
> > > this into _save.
> >=20
> > libxl_domain_just_suspend ?
>=20
> How about libxl_domain_suspend_only ?

Fine with me too.

Should I add also #define HAVE_DOMAIN_SUSPEND_ONLY or such?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrE9N4ACgkQ24/THMrX
1ywIGAf7BuzbqHHl88BqdfDOXrxrATHGhiwujnWZRujWXXq02BkXp7swcZE1cEJv
u6tVRbzHZav8Q5+CgVWb1vIoHsA6LkLbrcYDVV18aDNbqM1CKf7D9KpmVLMDqZIP
Y6lzNVG0+2eXYSYxYSHeMyy/DQYvC0sXBPMB6SeOosNiw8QsS9lxbbIKhPASQGfd
DDT0lP9Hl4ZaF15HnaRAEomfycHUEJllUn8U1dinpKTca8U1s1Qfuunx0KkOiKEa
sHc0RWUt9V8zLVbnmQG5rHnM2lAIEx+CwBFiSPL1HlK+E/8zQfVcOgxsMc759Rcc
zYLqqhvsY/OWOCgkiPN/ymqdOTDuTg==
=dsyJ
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--


--===============3450598356861639266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3450598356861639266==--
