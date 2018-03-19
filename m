From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: fix null sched build with debug=n
Date: Mon, 19 Mar 2018 12:33:35 +0100
Message-ID: <1521459215.5400.71.camel@suse.com>
References: <20180319022038.30100-1-cardoe@cardoe.com>
 <5AAF938402000078001B34E9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7752458084849703046=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAF938402000078001B34E9@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============7752458084849703046==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kmoPp8ujoVl6L0Qi9qXT"


--=-kmoPp8ujoVl6L0Qi9qXT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-03-19 at 03:40 -0600, Jan Beulich wrote:
> > > > On 19.03.18 at 03:20, <cardoe@cardoe.com> wrote:
> >=20
> > The null_dom() static inline is just used when debug=3Dy so it
> > results in
> > a error with the default CFLAGS and debug=3Dn.
> >=20
> > Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> > ---
> > sched_null.c:123:32: error: unused function 'null_dom'=20
> > [-Werror,-Wunused-function]
>=20
> Since generally only non-inline functions get warned about by gcc
> (afaik), I'm wondering: Is this with clang? Or with some specific,
> non-standard version of gcc? Adding such specifics to the commit
> message would generally be advisable (and indeed I'm not really
> happy to see such an #ifdef added, but then again I'm not the
> maintainer of that code).
>
I don't like that either.

Since it's used only once, it can well be killed, and
v->domain->sched_priv be used in null_vcpu_check().

We'll reintroduce the helper if/when actually necessary.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-kmoPp8ujoVl6L0Qi9qXT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqvoBAACgkQFkJ4iaW4
c+43mRAAgJvaD9Sa1YwPT/ir1W2gtpIF3i8S9NlaouMWga9ufcW/DVJ5q+LotugU
pCNyOUmvPoYD6zEfR/sElZ/k7Vy31VukyrsqHL8xcnTWz4xKVPhZtELYfTjMVK65
hCMyBtdVkgvcoajusRP1jhjH8rzNzwqPSGaPAMkXwaHFEjDPLoeRpQ5EPNUxjAT8
a7aa2kdrvgy41xS1bkFRNLRK/HtqNhI7SD4H+glUOUnxSpb3/TwUS2z4ZEli3exJ
XbI4CUj0sXmUlfywwkuuumFiLh/oJm+o8sabHcCRD3F5Q4dIXexlxhw805BZ3ne5
5se3cszujg5VfTAM2pQuM6YWjqxxs8hWfiVZx9uiWNoz4rdQ8pzsjRnHi09Ni2Qb
b3NYnbqklbtM6vWOWPY56FIUbU3yL63wH5fOuC91tEZuWXYtSPbSuTH3ZpWO0Jlz
cXYQOSBHXwdSaSPppnRWaLt7R3S1PUTQwpdBjRF7XsR5SXUNX3kGqyaLSM2zR3at
/0XxlAFYqjcvSHVqFL6gajpL0RvWYZcpTNb6uI4eMbc7Xg1ZPTSYZUOIbsZEJog9
3dCuU3nJY3HdGVu1Eu6RKHvN7r+1JGZ2I15waiEeQZf6F8j4t17BuwmlJj4ROPZT
kEGkEY/Ulc4718axBJK7+5KxGvQ1A9QX5kOKPpFVbxtxJQOg1u0=
=avf5
-----END PGP SIGNATURE-----

--=-kmoPp8ujoVl6L0Qi9qXT--



--===============7752458084849703046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7752458084849703046==--
