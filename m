From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 0/2] automation: build in an openSUSE Leap
 container.
Date: Sat, 17 Nov 2018 00:07:28 +0100
Message-ID: <99e079e2d8a7bb44b528cafb58f5daef474d7e82.camel@suse.com>
References: <154239232312.10244.2674246603103909622.stgit@wayrath>
 <20181116184457.db7gqwikyom65gps@zion.uk.xensource.com>
 <6b70f22f2573a01c883e993f07e7197423fba059.camel@suse.com>
 <166e546c9caf2d060cc747f3f1878bda92000e31.camel@suse.com>
 <3DE0228E-066A-4349-BB8E-D10A07FEE161@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114448515656402444=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nxwo=n3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNnDH-0006KR-4F
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 23:07:47 +0000
In-Reply-To: <3DE0228E-066A-4349-BB8E-D10A07FEE161@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1114448515656402444==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7QZaAqkxvm8VNRsxBs86"


--=-7QZaAqkxvm8VNRsxBs86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 16:51 -0600, Doug Goldstein wrote:
> > On Nov 16, 2018, at 3:41 PM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> >=20
> > But I have a question, Tumbleweed is rolling (and it's actually
> > rolling
> > quite fast); how can we handle that?
> >=20
> > I'd say the container image should be rebuild (or, at least, the
> > 'package refresh && package update' bits of the dockerfile be re-
> > executed), if not at every run of the pipeline, frequently enough.
> > Can
> > we do that?
> >=20
> > I see that we have Debian unstable, which is also rolling, but do
> > we
> > actually update it, or is it, basically, just a snapshot?
>=20
> It=E2=80=99s basically a snapshot.=20
>
Ok.

> We could create a pipeline to rebuild containers periodically.=20
>
Right. If that's doable, then I'll just prepare another dockerfile for
Tumbleweed (will be very similar to this one, although probably not
identical... I'll see about sharing/consolidating, but can't promise).

And then we do the rebuilding pipeline trick, at least for the images
of rolling distros.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-7QZaAqkxvm8VNRsxBs86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvTbAACgkQFkJ4iaW4
c+4mMA//XbuinmiW1RyrhDg740GlchNPp5OVInZA9niMhcGU+xoeWZ5pZ9gd8crt
08JrlUvUyD2liY/eCr/VlkNy84zPfbhrxjt1ZKWN4P2n/whoQcFGImNEKcyFfmaz
5995mfs5p611kcMbEa0roLu32a3Hyop6DC79p0UoLsdMaSmCJpkPYRxKn71Yfw2U
nR/EiqnpjGUQB8ur60ZlnS1HUjyfpqcA/oxS8J0qwdcBtrdxuYNFUaIiOpfoJIlx
dPUfqkuua3jcF/w7+yifR7dR7jWePrKDOku75EMmHLtJDaCy5D7o60E9/Uz9X7He
eywg9xrJBUV64kQslzJN8abPKGBoiknipjvtq7nSTeuYpHcVJivojuVp7DJP90Hf
QYJIzNlKZ4W/4o1B4e0lu8XCA5chovnnLeJo8zlTw6XUWt1HQXREDi91Fo3fXvOw
8EJcHHxLQZNlyQdaSIFeuDgmwNPanr4gyBh3hGf2S7OYQ73I20V1gDo6LtsuV5C/
1BFpkiFgg4TpDgXfqIT3NSzAJ+Vtc1AE+Epm1lFwTFQGclYY9V/DLqmKn4Bre3ky
JTjlD8WeBqZB5cPtU5PAL5QsNhH1Tu3QgMF8zmXhoYk/zNbQ1SN6nYxOl2BYIbnM
rfFqOdwjlk7t+hGqGes5UoJxTW5xNwNtrsJfm6wRNZI2eBGitiU=
=i9ac
-----END PGP SIGNATURE-----

--=-7QZaAqkxvm8VNRsxBs86--



--===============1114448515656402444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1114448515656402444==--
