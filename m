From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: cpupool: forbid to split cores among
 different pools
Date: Tue, 21 Aug 2018 10:43:26 +0200
Message-ID: <971a220c99fb911e6ce0234f5fbaf518216500c0.camel@suse.com>
References: <153478338599.30985.8474988297231115031.stgit@Palanthas.fritz.box>
 <3b093873-2534-d591-de50-8921e5b7f8ff@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5526665110073884182=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gbqd=le=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fs2Ge-0006s9-Ni
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:44:00 +0000
In-Reply-To: <3b093873-2534-d591-de50-8921e5b7f8ff@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============5526665110073884182==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CPnZSTYNvq8nNh0c5f7A"


--=-CPnZSTYNvq8nNh0c5f7A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-08-21 at 10:25 +0200, Juergen Gross wrote:
> On 20/08/18 18:43, Dario Faggioli wrote:
> >=20
> > Therefore, let's start allowing in a cpupool only cpus that have
> > their
> > SMT siblings, either:
> > - in that same pool,
> > - outside of any pool.
>=20
> Can we make this optional somehow? I don't mind this behavior to be
> the
> default, but it should be possible to switch it off.
>=20
Yeah, I was thinking to that too. I guess we can add a 'force'
bit/flag. Let me look into that.

> Otherwise it will be impossible e.g. to test moving cpus between two
> cpupools on a machine with only 2 cores.
>=20
Yep, good point!

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-CPnZSTYNvq8nNh0c5f7A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlt70K8ACgkQFkJ4iaW4
c+4qXBAAruxzoyArhf5JPt9b+9zuEeiHzUEFHsIa6WMhoF48QYQqq1QhtoVfOBZJ
NpP23Fum4MJLABfB5TQxDH6yIQ2q7w/5fQ6WN6JWv5Su7BNjjmWoWoeJ4IEj1D7L
5uj93NvEmPKPtqFksjBk07YyBymLcgzTZihY9CZlrCL2bJSxaByg6r0wt4F0iue9
4syI89QQLm6rnr7P0vP6lNVzeeKFbN+hzXbAVHIAsaROm9X4SsWJP9T8NOfZYMkE
9wss5WYuaLqDBIemhBp1JCfRKEEdZkLsEZ+rynqT81lFvviTYEuAq3Poo05S3Pht
g1wNBgUHkWRSr7j1jJN6XcAhzDVDkkv1tcPPRW3FxU0551HLV0dOGVJHZ1UB+22H
nuMGvFX9ln93jimtEAdU5NBKtK+ynfynkPf5mxCR3634q9rl7nCiEywWyxUvBSgH
WrsBmAmcEoY4KOj/NcqCfOWSxXjKGB7ao8X0hzHrpGJIsdcGgxxPLOhqyBDrBhFm
G9XhDDe9QkVdUs9TDWJlj5v7yt+pvOcp5EwSZbM5o/QxLUSiZtr2D4DLPfX5xxbh
R17JbyjsRm/sQsGS+FTQqtzn9ezQqrLF+INJZhEUQVXm0zr3IcZ/1DqAlZoT4DLt
fkvEOpWBPPqgTZBIjleIQC7whHS4YZDHfKVA72SSs1J4wFveKIs=
=z0/H
-----END PGP SIGNATURE-----

--=-CPnZSTYNvq8nNh0c5f7A--



--===============5526665110073884182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5526665110073884182==--
