From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 0/2] automation: build in an openSUSE Leap
 container.
Date: Fri, 16 Nov 2018 22:41:40 +0100
Message-ID: <166e546c9caf2d060cc747f3f1878bda92000e31.camel@suse.com>
References: <154239232312.10244.2674246603103909622.stgit@wayrath>
 <20181116184457.db7gqwikyom65gps@zion.uk.xensource.com>
 <6b70f22f2573a01c883e993f07e7197423fba059.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4000302462175930668=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nXWO=N3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNls3-0007cA-Fe
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 21:41:47 +0000
In-Reply-To: <6b70f22f2573a01c883e993f07e7197423fba059.camel@suse.com>
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


--===============4000302462175930668==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SUOGxTA+d5YIf9YG+AEq"


--=-SUOGxTA+d5YIf9YG+AEq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 19:50 +0100, Dario Faggioli wrote:
> On Fri, 2018-11-16 at 18:44 +0000, Wei Liu wrote:
> > On Fri, Nov 16, 2018 at 07:30:55PM +0100, Dario Faggioli wrote:
> > >=20
> > I have been playing with the CI system today so it could have been
> > a
> > bit
> > overwhelmed. Let's wait until next week to see if it comes back.
> >=20
> Ok, sure. What I'm most interested, is to see if the opensuse jobs
> pass
> (i.e., if I got the rune, the name of the container, etc, right :-)
> ).
>=20
And... it worked! :-)

Now, the next step would be to add openSUSE Tumbleweed too.

But I have a question, Tumbleweed is rolling (and it's actually rolling
quite fast); how can we handle that?

I'd say the container image should be rebuild (or, at least, the
'package refresh && package update' bits of the dockerfile be re-
executed), if not at every run of the pipeline, frequently enough. Can
we do that?

I see that we have Debian unstable, which is also rolling, but do we
actually update it, or is it, basically, just a snapshot?

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-SUOGxTA+d5YIf9YG+AEq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvOZQACgkQFkJ4iaW4
c+6otQ//d9VnAzxkcCEP5qVHeQlYOaRf4ORZzK7pUMfLjhCscKVSaqUECaYoGzVf
angqzkldQe/AQeUWKfwDjhTpcDsE0Yv68DfTwGrtCkZumXFcr3oNmvBwtEGG6BUO
dq6sdLAdJKCEP57Hk7pgxSoN+fonYE9StkMiL5cHx9DkGrtLdJDIpElt5xKNyYX3
bN/DuYhEsZa4GPt2OoA5ZBWhiPjQ69MO5e/LnJO/Om77IvnMpW7/fgzeITxlGkxp
tcD0kFuZUEOrcEFtG8ZZVODtz4S3gtWSrkYDMcjXBxm2hsUntrqQuW+aeXL6vptj
qf3bJBcq7fz4u785vqCSlYeQkFuGMLqyo6O1KHrFkCkUgydmVPSbKLIgIeG4hKev
d3K0RDmdwJZJ5mt8axPlUp49p3apiSWyR2O/vjsG220iviWn/fey1T0YzoelLbyi
MumTrPmUXQ2d6cWQTL4BoPNh4oqH/cNyjwRBWfZhVha/DJGLfFrKlJPtZ6/tb7rq
t7fCmwuCqdVxf21BE5mvgxZRXempLCZGecyUD4EiY0lSSJV3okatXDzBgiyFve1h
+5iW+hf8lsewFDguRix1NxM6vLLYaH8K38ToCcicYn3pNx3uw1XRvlg7QjOglIgc
hRggGkhEdxBAzwNzzP/CNbjBLlooOO0C9yrmaZIx53ElLQbdy3w=
=Ffqk
-----END PGP SIGNATURE-----

--=-SUOGxTA+d5YIf9YG+AEq--



--===============4000302462175930668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4000302462175930668==--
