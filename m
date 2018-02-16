From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] tools: libxenstat: fix format string
	overflow
Date: Fri, 16 Feb 2018 19:09:39 +0100
Message-ID: <1518804579.3813.23.camel@suse.com>
References: <151880261167.5804.2843218804728106933.stgit@Solace.fritz.box>
 <20180216174405.z2dut66rkh3x5pnw@citrix.com>
 <1518803708.3813.18.camel@suse.com>
 <20180216175836.xozwaxfhv3uzv22w@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1094498359361794214=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zwx=fk=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1emkSJ-0000be-JU
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 18:09:55 +0000
In-Reply-To: <20180216175836.xozwaxfhv3uzv22w@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1094498359361794214==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-A8DDbRJzsBSeUHFB/SzJ"


--=-A8DDbRJzsBSeUHFB/SzJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-16 at 17:58 +0000, Wei Liu wrote:
> On Fri, Feb 16, 2018 at 06:55:08PM +0100, Dario Faggioli wrote:
> > On Fri, 2018-02-16 at 17:44 +0000, Wei Liu wrote:
> > >=20
> > Right! And what do I do if it fails, 'continue' the while(), I
> > guess?
> >=20
>=20
> Looking at the error message again, can you just increase the buffer
> size to 512?
>
Sure I can.

>  That should do the job?
>=20
Yeah, less "elegant", IMHO, but less tricky indeed. :-D

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-A8DDbRJzsBSeUHFB/SzJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqHHmMACgkQFkJ4iaW4
c+7PFxAAqMLNKlb28SL61kYJx4dXUNGglHUEfDKVQDGlexWZQKcON/Vq4/DFZTzH
rFnF59krCApCfnvdx4EjdwRwjR7iFMmrAKBpY6blIQTHthsEPWCiEdrAzG2Bt6qF
tYxM45nANzOD7abT3LBhXBQxHBV7PL39imffY7qjglnrWRwltgesha/6+K1ot5d/
k7hgfWMU4+6rv5SNMF+236AIr6W7imFpqtYnA1+Bgf5KnmE0qQpoCYggna828Mzc
4q/PTRS8rma7TKkuhFNSUmYdre8/XIJb8G+8BOeD9lsP2MfNRK2wvliedXjMX5YE
vHOefMIDV2qQcMeu8OKpgi5siORKR0s6MZvIKv3z9tBfWU/afkNYJjTSIZUTxn6U
s+3jSpAVsKYxVWjttZsatdJxZByLXrH7VLZOo7GnxALFWrJI2/0LywR8Lbwwv0gV
pJLwcBURsLvhG1zsHY613GaCeceUbopdD8dhD92Av4ipY3YG0Tg5QlrHwzAqilDw
VHj5jm5pX02GD6Xzwbr2zL2uFNR/IzdY4RMdkDOhuDYGmbdYzAYhRdNq/ATGpHt4
/SH7PRWbm0IOz6yLmI1PrKw48oVOIQdWKTUcjh7qnXI5lADOPl99A+bDuM8gNDTF
9X8zRCcA4lCQIDjxPcjxWBnuCqyj31wxKDh25VfyKTK3r57nMvk=
=n1fd
-----END PGP SIGNATURE-----

--=-A8DDbRJzsBSeUHFB/SzJ--



--===============1094498359361794214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1094498359361794214==--
