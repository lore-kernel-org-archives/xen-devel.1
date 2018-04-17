From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 0/3] vcpu migration improvements
Date: Tue, 17 Apr 2018 09:55:22 +0200
Message-ID: <df03b7960f2941a0bd15f17bf62753c2b113fb03.camel@suse.com>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6158964112147155604=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yslv=hg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1f8LT0-0004XM-PM
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:55:54 +0000
In-Reply-To: <20180411122518.26270-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org


--===============6158964112147155604==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AhtxPfz1KSKEOG4DMHhS"


--=-AhtxPfz1KSKEOG4DMHhS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 13:25 +0100, George Dunlap wrote:
> Some compile-tested-only sketches of what I'm talking about.  Let me
> know what you think.
>=20
So, patches 1 and 2 of this series solves what I think was one of the
nastiest races I've ever had to chase in the scheduler. :-)

Having figured out what the exact root cause of the race itself is,
this is the _proper_ fix, as it puts setting of VPF_migrate and
SCHED_op(sleep) inside the same critical section, which is what closes
the race window.

I'd like to argue for this series to be considered a bugfix, and
included in 4.11 (and backported as far as possible, which has been
already proved to be feasible, e.g., until 4.7).

The alternative would be to come up with something else which kind of
works around the race, within sched_credit.c... But I don't really see
a reason for doing that. Code-wise, it may probably be a bit more self-
contained, but it's not like this series is that spread/intrusive in
the first place.

And the net effect would be basically the same. I.e., in both cases, we
need to change what happens when vcpu_migrate() is called, and I don't
see much difference between doing that by changing vcpu_migrate()
itself, or by changing how Credit react to vcpu_migrate() being called
(especially considering that Credit is the default scheduler).

And therefore, between a proper fix and a workaround, which have
similar impact and effects, I think we should go for the former. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-AhtxPfz1KSKEOG4DMHhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrVqGoACgkQFkJ4iaW4
c+4SWQ/4jIZP6gVWob33M7cRY3wV33W7uFcfF5PwhQifBn+kQev3mpNvb6YCFoDN
rUynOa1TnuB8xLygZRu2V4z2Ek7vUo+PMuuYyEbWsWVgJSmDtVpAbSBMaViOLQTJ
8aqXjpfQFxAqX8/iUW5pcYtkSC4C9HO4PomNf43MGC7STwJwD/88r2aGr5ML8OeK
JDCd6cvBNEHuVdbSxlmdbWyWUycwcYTbehTrJzNJJDZ+hJ6GmX/bZSPmVBjwWKwh
CpGvSromq2bZ9UC7fz80I1dP6uzW4qNAtq3SbunB5E7t+rr8uStGYmUgRnps/MbS
nlBBM520Edye0SNAuMSNpNmhFKPpeMYrXT3EGWqxcYnq+5JKTPvP4aYBwkz/NpIj
wxA4eqIOiJ03E+LNet3p5iAyvR1iHV2o1RN5p/U3P910INAJCHychvOPOwl1PeO/
rkq5aXhCuoicgz+xFSMHS/k6UDD7zPGbvq5RnrAMg6atM4W29lTmBBTW+mOCnTak
vDvaVKOeb9SiZAjhaLt9LI/fZd3BhSaSBiWBkSs704SdZGUhg/lgwk/OJGRb7yD4
DDhNqqi/xJ7ezwsqIGJ4fHt4bIyGr+LiE0AABHA7qZ9DW78+L+0VCPjM9REQl/nX
GBGqb/BSovbbtUEBIJ/51DpxRZmWjMM8rOohY2qj6TklImsMhQ==
=z2LW
-----END PGP SIGNATURE-----

--=-AhtxPfz1KSKEOG4DMHhS--



--===============6158964112147155604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6158964112147155604==--
