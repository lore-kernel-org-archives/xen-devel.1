From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Fri, 12 Oct 2018 11:15:53 +0200
Message-ID: <d6956fbf7441ae3ced4a273c58b7126db1c6466c.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
 <3636eba03691a0331a6e82cb11a651fd41c475ec.camel@suse.com>
 <6ffe5f58-8aec-c349-e08b-58dc1d3d5469@suse.com>
 <8224a31a6fd968344499b52e4bc77d78576c1a8e.camel@suse.com>
 <60e809eb-1971-b467-9a56-c116c60445b2@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4836073544742746207=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ulkm=my=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gAtY8-0006Om-EH
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 09:16:00 +0000
In-Reply-To: <60e809eb-1971-b467-9a56-c116c60445b2@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Bhavesh Davda <bhavesh.davda@oracle.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============4836073544742746207==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MwPK8GIorTL6BH9vy6YR"


--=-MwPK8GIorTL6BH9vy6YR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-12 at 10:35 +0200, Juergen Gross wrote:
> On 12/10/2018 09:49, Dario Faggioli wrote:
> >=20
> > But how easy it is to opt out, if one doesn't want it? E.g., in the
> > context of L1TF, what if I'm not affected, and hence am not
> > interested
> > in core-scheduling? What if I want a cpupool with core-scheduling
> > and
> > one without?
> >=20
> > I may be wrong, but out of the top of my head, but it seems to me
> > that
> > doing things in schedule.c makes this a lot harder, if possible at
> > all.
>=20
> Why? This would be a per-cpupool setting, so the scheduling
> granularity
> would live in struct scheduler.
>=20
Mmm... it's already starting to be a bit hard to reason, without
looking at at least a prototype of the code. :-/

But, anyway, if I'm in sched_dario.c, and schedule.c makes me reason in
terms of vCores, how do I deal with single CPUs for a particular
cpupool that does not want core-scheduling?

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-MwPK8GIorTL6BH9vy6YR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvAZkkACgkQFkJ4iaW4
c+6UVw/8CQIkCvg6iu83LJTYYOWeHl09c9NSlTjIwEAo3RP8uzEE14VXxvH2lwec
4El1gul+OE5ifmCmEuBpVPShVkkpd/3JQ+AspHJXAM+iYz46lBeYCg55vbcUi/YS
1slj8ightlz6Y8eCg0jUHbkYYKfQnm1CD38V6e+R97nnMBR4INvjg+fdwYmygUmk
/9jcfg0zn9iXT8Bee5WWyY+bXr1mqUxbAappivmPdosCh+ki+cx6+W23gsMgSxnK
y5M+yl1pVnicGCQlzhX0qWYYtrZYZYFobMGiGLyGMv8v9onV12zwtiuK4/GqMNMO
ROwWkhYakzotizSU2seF06TuGmhsRLE0gdHxlg1rvFOoSTXvnDeMvipJrlaZ7lgJ
orMk1WspCpfmtBxvUUTvgBpaobRG1t94tVuS9LnZTl8u1IvUoTael9coBnTaiXmu
Zlcvt/Tcjuez448sL+wEd0wEURTW65zgAI1bO2dQpuffyUiS3xz3FqKF0Ff5gyK8
vA+McbszE9XHhwIVJWHfDpxyB8SYMKDY/cm0lf9QEcrJsv5ZXKkxv3Aenq/UFinf
dHnJhBB+8pMQUvN7B+Y6KdiGF8epkCB3RMPi61KQKbSFYpLSN7mOqK0SAeudsbkD
XDIANlKxuZb+CZNtyHCyBmy2jPbK/J1vh6/gyRLdilyo7ChXxoY=
=saeH
-----END PGP SIGNATURE-----

--=-MwPK8GIorTL6BH9vy6YR--



--===============4836073544742746207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4836073544742746207==--
