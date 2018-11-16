From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 0/2] automation: build in an openSUSE Leap
 container.
Date: Fri, 16 Nov 2018 19:50:47 +0100
Message-ID: <6b70f22f2573a01c883e993f07e7197423fba059.camel@suse.com>
References: <154239232312.10244.2674246603103909622.stgit@wayrath>
 <20181116184457.db7gqwikyom65gps@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8085040451362660888=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nXWO=N3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNjCV-00030K-SV
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 18:50:43 +0000
In-Reply-To: <20181116184457.db7gqwikyom65gps@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org


--===============8085040451362660888==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xKm04ozwEc00SRkUxlB9"


--=-xKm04ozwEc00SRkUxlB9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 18:44 +0000, Wei Liu wrote:
> On Fri, Nov 16, 2018 at 07:30:55PM +0100, Dario Faggioli wrote:
> > =20
> > https://gitlab.com/xen-project/people/dfaggioli/xen/pipelines/36897573
> >=20
> > (Not sure if the fact that it hasn't started yet is my fault... :-/=20
> > )
>=20
> I have been playing with the CI system today so it could have been a
> bit
> overwhelmed. Let's wait until next week to see if it comes back.
>=20
Ok, sure. What I'm most interested, is to see if the opensuse jobs pass
(i.e., if I got the rune, the name of the container, etc, right :-) ).

> As far as I can tell the Arm64 builds are already done.
>=20
Ah, yes, now they are.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-xKm04ozwEc00SRkUxlB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvEYgACgkQFkJ4iaW4
c+67+A/+J8V4d5whOZsfuxfCqrf3SXFIZI0lsqYbLCn0bB5gRZ1Q9rQb2Ekm+YiS
IJ/+Q9+wnpXP2eQiftlsceT+Cyhm/3SJhsWJadbqOb40iMxufrcK+/pbXx5Zsa18
eBx4KRe4y1R77m6LSvWSM3oyizM5irQ8lort2LFMzJwoJdUUi42cB5OpjKE/R/fz
kKVhw0ZOW0A98awriO48tIwL3+43ZUatCzsCHEeH6YXuxD3R+p0Ha5kR5d653flQ
+TNbl9wBjnJxWwinD9XdLK60O1HkGtTUH8Yy91SqwQLtAszvvV8L/itM1bggs/t2
+XLiunrmLC6HkgKpCp/RfiiZ29YCrhCVkMo7mEl6rJ9yD0gajjUk9I61rHZmYK6Q
1Z23hFjh+d/aQMQZfVk/WYLkSVcES5/PVr/RR//XQqu7qc7cwFVZdQ8UG1N6HUa2
1s4CNE5FDq7w92BQw+wjaJkVbQ7c0WZ75SRkKp80PclCCXfmupST+9Mel4gliwft
eeiovAY2XwD7yaWQeEMP2n4kvTfTcIVs/xMk85brySNqHtkyJd7on6FeydzQt/wI
Rbe6yO0miMCTgCAjh2rtZc3lN7Ie0Z2tsPXi6y6vYJ+Y+jAEm9P/GhnwiiDKjpRY
Y9ZLkuDmnMeb6ZU1ZG8ZNwt6qcp5dWArryLgJxUH5ZyiRCOZts0=
=3i/y
-----END PGP SIGNATURE-----

--=-xKm04ozwEc00SRkUxlB9--



--===============8085040451362660888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8085040451362660888==--
