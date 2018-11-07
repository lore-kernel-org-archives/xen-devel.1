From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: sched: Credit2: during scheduling,
 update the idle mask before using it
Date: Wed, 07 Nov 2018 18:58:54 +0100
Message-ID: <742baf00117093a38fbd35b8ffb7e0d13b0cde61.camel@suse.com>
References: <153926549830.22680.203200918007449375.stgit@wayrath>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7367197121225770723=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3bvd=ns=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gKS6Z-0001im-LS
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 17:59:03 +0000
In-Reply-To: <153926549830.22680.203200918007449375.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7367197121225770723==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0GFY1BRJghQWKtSmcMtT"


--=-0GFY1BRJghQWKtSmcMtT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-11 at 15:44 +0200, Dario Faggioli wrote:
> Load balancing, when happening, at the end of a "scheduler epoch",
> can
> trigger vcpu migration, which in its turn may call runq_tickle(). If
> the
> cpu where this happens was idle, but we're now going to schedule a
> vcpu
> on it, let's update the runq's idle cpus mask accordingly _before_
> doing
> load balancing.
>=20
> Not doing that, in fact, may cause runq_tickle() to think that the
> cpu
> is still idle, and tickle it to go pick up a vcpu from the runqueue,
> which might be wrong/unideal.
>=20
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
>
Ping?

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-0GFY1BRJghQWKtSmcMtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvjJ94ACgkQFkJ4iaW4
c+6Vvw//QT9IIohircsd8nHlKe9yn9vr5hEdCl9wklFS3dR6VxsNxO6N/UeceO8Y
YwZK6T93Y2uMuvSV/DYzhX3oDYbOOtyPQT4ycxdIGiEOhiaOux3fotNAp6d923+4
myIevWk2JyJTvXdpODU+TSrUCm6SfF59idRki9B/PYl4+xQpJCc4WtSkDiWh8etq
QCbHGtoc6yyB9BbiSNjZ6Ro7BTYUysRImMFiVg+GDBNz7+9PPPrjmkGPuaBJPrh2
RQ2K+rlOCakSXSRxSWtqHvVERr6BmLJvMv47iL0tKrdcpoHWdzRW8/AYh6RuOGal
KBeLft1R/9ZUiblGcs2H5nwDHhn7xqMCZIrds/NUt8eswvNDNvz7jA7KaAtbrnFW
HanKYOCzCleIfzFnQDoPYcu9AKQ4xvNeIhYvRgK8CSOXBwhjzMCRMmr/oS9HiPe4
+UKQPjooJHSjRDeC8GqTas3c8eq5O8TCP9TdC9eNoZbabCQ64TEGU57qiQHSEIw2
3+KQ6nbUabEiS8jUAyVZHPlxjow4KmZ8YRSW8K3gFQC3rW/ZyZGi/djxWJDqL6ef
K7Cn2UrXN3ivLtU5FRJWvQr/QYot15mX21FSeSzTaZSGafO+GHBoVKps3xh3xlCe
XAmp9uuPsQ399xTOueY+eRffH4p9eJh+fUZSXB2Vbi/FWh9xOOg=
=SOsT
-----END PGP SIGNATURE-----

--=-0GFY1BRJghQWKtSmcMtT--



--===============7367197121225770723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7367197121225770723==--
