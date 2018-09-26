From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 01/12] xen: use macros for filling parameter
 definition blocks
Date: Wed, 26 Sep 2018 17:32:43 +0200
Message-ID: <02b55075fb635b9e03914131c3a58a527515db5f.camel@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7941678875406055313=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5BoO-0007Of-Sz
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 15:33:12 +0000
In-Reply-To: <20180918060309.7186-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============7941678875406055313==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4w70lemBC2+VZQNde2JO"


--=-4w70lemBC2+VZQNde2JO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-18 at 08:02 +0200, Juergen Gross wrote:
> Define macros for filling struct kernel_param when defining
> parameters.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-4w70lemBC2+VZQNde2JO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurppwACgkQFkJ4iaW4
c+7+LBAA2MSJEPVr/AV+ujZstMA9Gt8OczR39N5G+q0ahZTdsxiehck4pN1huyMJ
tfihds9zqVhgK0xlNmg0JlcRwVHJxt8qhi3zdSRlIfRT+F+7gA9IG5xWBWc/TwtI
WHc5EBe1nv4IY/z0R1eRKdJIgeBbES2TpMNmks2hNbW9cO/aCsQctMmOI5aBc8Ll
OA97iKLKddkV4hWKnDkAEUY8b5wYyYpAw04NIJ+Q91Pxrp9ImCLmwOJu8HyK/458
sCUZu/CEsOBfJfi635xUtQpZoPTk0vKdNIlA0oPB/xvgbc3IpKsi1I5Zv54IB/Oy
NUtBMMN7c84pWHgixgRq1V3leqGSuJk075YAHK56YIaiDDnVopZJcuHsXK7uAJB7
aX3twwxUtexXYQaT8q0+ZtmuRW9xSA9TwXncIb572m8bJlRWZP5DBLG1UAOHEUOv
yVj8l6U8hPywz7iJL9Gs05+uNUMiF6ntG1T0cb/C3H8pkf7h3MBwYo8npUbZPiyB
7Dx0wGbkrIpWFGxXhilCrP9Woh7bNHWeKasc7Fyn/G82Zljvwdqe24kAh3u9cMxD
X8CjO4vSlfq20cstNg2E72UoDQcUK5mxuk5bhtRlFklx//NGsVBhle34xOe3CATk
VW0wVLh7QvPJXb0SuAWHcA29k5GDiFov7pXFK7FjuhaaqF/NGPM=
=LgN0
-----END PGP SIGNATURE-----

--=-4w70lemBC2+VZQNde2JO--



--===============7941678875406055313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7941678875406055313==--
