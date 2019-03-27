From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 17:51:43 +0100
Message-ID: <4585c758d5e6928acf5ed714ad5f13bf3991492f.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
 <42e0d691a0e00149ba585382e26494159dbb71f9.camel@suse.com>
 <7090ec7b-e37b-35d2-67d9-97c32369fe8c@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8170971984141018914=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9Bmi-00005U-TG
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:52:16 +0000
In-Reply-To: <7090ec7b-e37b-35d2-67d9-97c32369fe8c@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8170971984141018914==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UE4/4Yw3Gv+GEn2ubU+s"


--=-UE4/4Yw3Gv+GEn2ubU+s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-03-27 at 17:31 +0100, Juergen Gross wrote:
> On 27/03/2019 17:24, Dario Faggioli wrote:
> > On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> > > cpu_disable_scheduler() is being called from __cpu_disable()
> > > today.
> > > There is no need to call it on the cpu just being disabled, so
> > > use
> > > the CPU_DEAD case of the cpu notifier chain.
> > >=20
> > So, what do you mean with "There is no need to call it on the cpu
> > just
> > being disabled"?
> >=20
> > Because we still (even after this patch, I mean) call
> > cpu_disable_scheduler() on all non-boot CPUs, aren't we? It's just
> > that
> > right now we call it from __cpu_disable(), with the patch we call
> > it
> > slightly later.
>=20
> The CPU_DEAD notifier chain is called on the CPU requesting the other
> one to go down (so on the boot CPU in suspend case). So we call it
> _for_
> all non-boot CPUs in the boot CPU.
>=20
Mmm... ok, I see what you mean now.

I guess part of "the problem" is that "call func on cpu A" reads, at
least to me, as both 1) call func so that it acts on and change the
state of cpu A, and 2) call func in such a way that it executes on cpu
A.

But I'm no native speaker, so it may very well be that the confusion is
all and only mine.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-UE4/4Yw3Gv+GEn2ubU+s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlybqiAACgkQFkJ4iaW4
c+4qlRAA3ogen+dPQpgQkAOY6OioVOhPjZ4TXautIETP7P9713aaLPGrUsEXyGvH
/mHwvXToWbWFMpsU6wKFWqKldKwO8y6lO2yGKFitQ4G3Hm6m9jRRT0q6lCjsfMw3
8oGZQXxpzpH3z531vrufBdT5+27iFKaK+ONrRlmGfCOrUm9noFwqY9JJnvAYwVlc
J4vdG8TLA+weFMzzGC5mrOU3WK/r671dRUHmC9x48/PU23crBXm+Vm94cwg/AtD8
fM0Jk/+EDC1bhsgW/RfVoHsqr2YqBn4hDdXwPHkNdWXucv4nw+99d1ZVw+V+T3wL
yyhAUhgOS/jK6GGZ7dUfMNmtEwCm90MHUaKRBD7TaExW+SO2eGh/gvPr//qVmi4d
rFXfwC3Ojyb6hlREjF6+qpf0Ll/nmcirSAGYGP7cz4c6HwiOrU26xQvFCamisPSA
Cm/xZhw36pNSOpSutRIkrq+986Bs7NDsFJVtABvMwdxq1qqx962MTq/yVwXzTth3
xuJFRXfuAr+G545nGZxkA/QCyuetKWwa+MYN+o7OL0rgoWKtxMEzEyXliuLIj/84
MF1FadA1zNlk2g/l208YH+rSYp9a8X37dCjeh9I4XZ1iCinembr5dKk4gPOBuxoU
KoSV65vIcnY2vTgToZ2h+LOiP5Df+J1PUHLYRMEdfJA+EBWo3EM=
=/5e5
-----END PGP SIGNATURE-----

--=-UE4/4Yw3Gv+GEn2ubU+s--



--===============8170971984141018914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8170971984141018914==--
