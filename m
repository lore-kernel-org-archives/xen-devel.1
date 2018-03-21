From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RESEND 3/4] xen: sched: improve checking
 soft-affinity
Date: Wed, 21 Mar 2018 17:57:23 +0100
Message-ID: <1521651443.5400.133.camel@suse.com>
References: <152113809162.10025.17478920051714635122.stgit@Palanthas.fritz.box>
 <152113895082.10025.4949278803673146814.stgit@Palanthas.fritz.box>
 <b567625e-c4c6-b70c-16ff-ef420b113219@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1326110292421066576=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7sqo=gl=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eyh3h-0000fM-SE
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:57:53 +0000
In-Reply-To: <b567625e-c4c6-b70c-16ff-ef420b113219@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anshul Makkar <anshulmakkar@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============1326110292421066576==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ItOeYrEX+3AGIVUdBIXW"


--=-ItOeYrEX+3AGIVUdBIXW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-03-21 at 15:24 +0000, George Dunlap wrote:
>=20
> If you're OK with those changes,=20
>
I am cool with every one of them.

> I can make them on check-in (as well as
> changing your email address)
>=20
And thanks for this as well,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-ItOeYrEX+3AGIVUdBIXW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqyjvMACgkQFkJ4iaW4
c+4qFQ//cA6eyPYrP/RlrZfOPXnjsS+n3qwFWYgkNntF8E9aUBF8cmkq09rxckno
/rOr5G6ZGrP183u+YnpF3dQ7VdngeyEGgQKZzG4roFqHljQiVlHUuEivs0Jl+9PB
2UJgVV0kuVS9AIPspZommmN91Aq3D2kx+giLvqf1txhGjS7ky94alUGGOAiWu9zj
X8gISUloEujntMVxyAS0q/RNvN6qf2xK7IACFfswfWwEE2r+esr/VYSfJwfsNI8j
BP1XAXgUX4xT5voyoYzAKSTV/0AmSeJ/AoXyTUO3jIeXffzoO6Yi12dERL5Xonuo
JqwSHuMXtCHwm6AL7gwCXlYxctaXgynV47jBIpneZJTtztaBzhz6GvGpjINLOgnP
BgOWS4CZfTM11MAOuAvT+msoQQX+uZvXAj6XOXpzplyDB4WINeCNV+Vv9pGCClwD
Mxa6bHV5abQZId9JqLEYy8CvS1yjjsXbYnXPfCKsL2+Y4+HEd//93f92ILg0mhFx
o2fjuFEatUxzePZK1qWElQ8N7O6litlu+h97885NqWoCP2XS/kUkFzHo/Lhm0rmf
vYMIsvvMx3HB3wSri/nW3b/oVajmnpP0W+lVNV9I3wMxXIKYYLlWFglwLq/YCa+Y
ps9SFmTZ84tS2vfb/SGWycKaX+UwGitlWLulFkgZ32PByKI5Lm4=
=atV+
-----END PGP SIGNATURE-----

--=-ItOeYrEX+3AGIVUdBIXW--



--===============1326110292421066576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1326110292421066576==--
