From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] sched/credit2: remove stale comment
Date: Wed, 09 Jan 2019 14:59:27 +0100
Message-ID: <197710253aaa5466fc2d507b5176d1b608846012.camel@suse.com>
References: <20190109123438.6837-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2287012510742557016=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lJUa=PR=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ghENg-0002pz-1T
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 13:58:52 +0000
In-Reply-To: <20190109123438.6837-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2287012510742557016==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tJ2vtufwvVp4RPipAQ0g"


--=-tJ2vtufwvVp4RPipAQ0g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-09 at 13:34 +0100, Juergen Gross wrote:
> With being the default scheduler now the comment in sched_credit2
> stating it being experimental should be removed.
>=20
> While at it remove the "TODO" comments already addressed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-tJ2vtufwvVp4RPipAQ0g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlw1/j8ACgkQFkJ4iaW4
c+4I6xAAzO9U4QJ/4RyWqjbuUxY3+3ls1uHHdbr2HZApqnOiTn8NbzczfwjawITd
ZYvREkmy44o+IBh6rlReWYLqdWYyWZwnWDyRYjgtsa0qrhVYqrdcXCRNu/5BcI5r
qmFyZqnSwnmBc/G7epXSBS6Ym98Y/vUd+BTA0jznYHRjYdFxYyK2mCCL9Ys0Q1pW
c7uLt3HFp1JtJnFSZaqO4Ztz6Lh6A3ufLZm/vDlNFRinyBuvChj5QyhZtow2VtyD
foWi2fg8t5B+RPA5J5/+exh6m3cRiuHPe61k53LlzArXqlQci9hcCUDzlUmqFX47
e7jqvpwM/M/QdLGbKYoyp0gzRv6JrUA+/i0VjWA4+4PL2QTDozgkOL8xIFtz4KZ9
l0sRZzkXbVspcjixalnP3O8S93B9p5qviIOBv6f9Jc+Hm4O5Oa/43s+JE40Pms00
LyQG7W6HvUCf1j4pnjiAbW+oIUXUTs93Grh3f9GM1B24ARXKICk/ulHEnXtngHIP
ISfTQZUFmwWlJAoP546shoB+p6agE/PcM6M+Jk87cs040mb8/NYGDNZfcKhyV+7t
4CoBddEE7wOc1qW+CIm+994R+fuwrs29bYeFj8X06qYtOwyMB8i5tVI8dv1hVUDo
ObqwF6eoPJhLOOEL/eYgssqyXTSerT14wRDhPL4v8WhIcUblP/s=
=N6vG
-----END PGP SIGNATURE-----

--=-tJ2vtufwvVp4RPipAQ0g--



--===============2287012510742557016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2287012510742557016==--
