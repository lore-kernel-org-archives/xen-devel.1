From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: intel_pstate driver patches by Wei Wang from 2015
Date: Fri, 14 Dec 2018 15:16:54 +0100
Message-ID: <20181214141654.GF989@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7840457279175813110=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gXoH1-0007sB-Oy
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 14:17:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Wang <wei.w.wang@intel.com>, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org


--===============7840457279175813110==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Content-Disposition: inline


--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I wonder what happened to intel_pstate patch series[1] back in 2015?
I've seen there was some review feedback[2][3][4][5][6][7] on v6,
patches 4/6 and 6/6 were acked. Were the review comments ever addressed
(can't find it)?  Or maybe there is some other mechanism in place for proper
power management on recent Intel CPUs? Apparently acpi-cpufreq driver
not always does its job well[8].

[1] https://lists.xenproject.org/archives/html/xen-devel/2015-10/msg03048.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg02043.h=
tml
[3] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg02410.h=
tml
[4] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg02430.h=
tml
[5] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg02443.h=
tml
[6] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg02456.h=
tml
[7] https://lists.xenproject.org/archives/html/xen-devel/2015-10/msg03086.h=
tml
[8] https://github.com/QubesOS/qubes-issues/issues/4604#issuecomment-446816=
536

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwTu1UACgkQ24/THMrX
1yzMQgf/YUqolseHwD1g5Fu0JYxJjd/mlSf8rForlbs7ydqfT0sN2v1dUOE8eEbS
HEXxZqgMdz0weHwsS6ZdlLLtotow7EXU3PUxlbuhnWVJujvXvX6zYj7rbUBT0G5D
7BoP4K+edQ6Mvp5mTg0h4h1V+4sIGRGY9eH/o6Sewf6Pp5Y/6g2LY6K5DtoCdxXp
kJjoF3TwEbFLqIalgUdHlGebtkAtYid0UeuJLtjqgtICxmNbnhJtkWuEw3od/+pz
eGCOyWvX7kUYwJ8WEqp7UAx3BvLLBCQQ1n/zBxHom1MESscKspbWWJCGKD8hNmcn
htK/TQl1YfQ0ooHSi7Y58FWu0RnIxw==
=GVv8
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--


--===============7840457279175813110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7840457279175813110==--
