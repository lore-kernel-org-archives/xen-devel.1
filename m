From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/5] xentrace_format: combine 64-bit LE
 values from traces
Date: Wed, 12 Sep 2018 09:47:16 +0200
Message-ID: <a3ecdef99586cbecc3ff565b5a32e7945dcbba67.camel@suse.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-4-git-send-email-andrii.anisov@gmail.com>
 <ead12893-8bd0-5438-5356-937d712e08e4@citrix.com>
 <13a287f0-bd56-c8c6-f6b6-56e7034247c0@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1107705412364525353=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fzzsZ-0005nP-6O
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 07:48:03 +0000
In-Reply-To: <13a287f0-bd56-c8c6-f6b6-56e7034247c0@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, George Dunlap <george.dunlap@citrix.com>, Andrii Anisov <andrii.anisov@gmail.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============1107705412364525353==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oz5sC77EJlWtVSgo2Hai"


--=-oz5sC77EJlWtVSgo2Hai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 15:23 +0300, Andrii Anisov wrote:
> Hello George,
>=20
>=20
> On 11.09.18 13:48, George Dunlap wrote:
> > I like the idea; but what does 'LE' mean in this context?
>=20
> Little endian. Most significant 32bit word is at a higher index in
> the=20
> array.
>
I did get it, but it took it a little bit, and a couple of re-reads. I
guess, just use 'little endian' (both in changelog and in the code)?

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-oz5sC77EJlWtVSgo2Hai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYxIQACgkQFkJ4iaW4
c+5G/RAAxsxyjBe/cIozNj16chRZ7tmCU2n84HuS3kv6M62tm2NFjuwt3Z1JKGQQ
HTKq/tpX+XjPzQb+cWi3e0zSvGZKXWuMS/R0sHO9mIqAnKCfmM1hLH79vHmVHS6w
mAejF2DltmRFL0AOR53DloIX4gIyQO9xOjcseUvIPr/KLQi0mqKSN9+B8xyYltnK
wMCj/bqfDqjb0E/FbZuGnKcb6Iptj9gLfKWJWV1tUWvcmswQ0G4V5VX+lfjzfy0G
IJ8ZUG6rPOSghEuPYy56/MoPhgaSp0QZMJ41/FwFyjaGzU2XAmoZlDlaeiUXpYbd
uHKq5JH6sQ2u3K2QD3i3SI/nlXmJQxWtgHP7aydIAnPamMZDM63NhFA8VPWY9o1o
rZiJE9Qu2wSsEZshSbo2gZMp3/LcK5YYjBbF/w5AuiE3smioe3KNQmmvlqOYDgLM
7XcPwOhWs/TPR3LqgodcOrSi9cFnTCqkGQ+dSK88rpBhFuhXekoO0g4hI/+6RZwD
HEQWa+3ijG2EhpikbRS4sBcRHeO1l8zal1gQKyTs/zK4gQLVptf6znhb0Bew80Qb
uWX/EaOnCqIdsgGDZz5wv+ANOHvQXXwPgVHe+QNZD4gsjQ3QGAlZpIptG+R97sQk
C6H0Ica1nBoYJyRgPf3MN9pXjbopHw9DW7/LrJxRvEvHL+yZ9sg=
=eYmO
-----END PGP SIGNATURE-----

--=-oz5sC77EJlWtVSgo2Hai--



--===============1107705412364525353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1107705412364525353==--
