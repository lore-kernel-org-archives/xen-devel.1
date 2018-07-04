From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 05 Jul 2018 01:51:59 +1000
Message-ID: <1813867.Jnpbfve7Wy@wopr.lan.crc.id.au>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7098104623206257518=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=g09h=ju=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fak4f-0003Ve-TK
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:52:10 +0000
In-Reply-To: <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7098104623206257518==
Content-Type: multipart/signed; boundary="nextPart6899638.daCjOmCk2O"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6899638.daCjOmCk2O
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, 5 July 2018 1:26:16 AM AEST George Dunlap wrote:
> > On Jul 3, 2018, at 11:07 AM, Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > wrote:
> >=20
> > On Mon, Jul 02, 2018 at 06:03:39PM +0000, Lars Kurth wrote:
> >=20
> >> We then had a discussion around why the positive benefits didn't
> >> materialize:
 * Andrew and a few other believe that the model isn't
> >> broken, but that the issue is with how we>>=20
> >>   develop. In other words, moving to a 9 months model will *not* fix t=
he
> >>   underlying issues, but=20
 merely provide an incentive not to fix them.
> >>=20
> >> * Issues highlighted were:
> >>=20
> >>   * 2-3 months stabilizing period is too long
> >=20
> >=20
> > I think one of the goals with the 6 month release cycle was to shrink
> > the stabilizing period, but it didn't turn that way, and the
> > stabilizing period is quite similar with a 6 or a 9 month release
> > cycle.
>=20
>=20
> Right, and I think this was something that wasn=E2=80=99t quite captured =
in Lars=E2=80=99
> summary.
=20
> Everyone agreed:
> 1. The expectation was that a shorter release cycle would lead to shorter
> stabilization periods
 2. This has not turned out to be the case, which
> means
> 3 At the moment, our =E2=80=9Ctime doing development=E2=80=9D to =E2=80=
=9Ctime fixing bugs for a
> release=E2=80=9D ratio is far too low.
=20
> One option to fix #3 is to go back to a 9-month cycle (or even a 12-month
> cycle), which would increase the =E2=80=9Cdevelopment=E2=80=9D part of th=
e equation.
=20
> But Doug was advocating trying instead to attack the =E2=80=9Ctime fixing=
 bugs=E2=80=9D part
> of the equation.  He said he was a big fan =E2=80=9Ccontinuous delivery=
=E2=80=9D =E2=80=94 of being
> *always* ready to release.  And I think there=E2=80=99s a fair amount of =
agreement
> that one of the reasons it takes so long to stabilize is that our testing
> isn=E2=80=99t reliably catching bugs for whatever reason.

On this point alone, release quickly, release often. The kernel for instanc=
e=20
runs about 1 release per week on the stable branches - sometimes 2.

With regular process, releases should be easy to achieve - and that means=20
automation, automation and more automation.

=46rom my end as a 'consumer' of this process, a regular process makes it e=
asy=20
for me to rebase work based on a regular release. In fact, it usually takes=
 me=20
less than 30 minutes to update, compile, package and release kernel builds =
=2D=20
and all of that is compile time. I check kernel.org every 6 hours, and fire=
=20
off automated builds as needed. The reality is, I could easily make this=20
hourly and reduce time from release to package to less than an hour - but a=
t=20
that point is it worth it? :)

The longest delay on getting this to the clients is the time it takes for n=
on-
local mirrors to catch up.
=20
> So a fair amount of the discussion was about what it would look like, and
> what it would take, to make it such that almost any push from osstest (or
> whatever testing infrasctructure we went with) could reasonably be
> released, and would have a very low expectation of having extraneous bugs.

The key here is testing. If we started at the release end of the tree,=20
something as simple as a git tag triggers a tarball export of the tree=20
versioned as per the tag may well be a huge step forward in the release.

Then time can be taken after this in tweaking the testing part as we find=20
things that become obvious through the rapid release process.

> I seem to recall saying that even if we agreed that moving to continuous
> delivery was a goal we wanted to pursue, we would still be several years
> away from achieving anything like it; and so in the mean time, it would
> probably make sense to move back to a 9-month cycle while we attack the
> problem.

Honestly, as a packager, I don't see ground-breaking changes in any version=
 of=20
Xen that is currently released. Most are optimisations like the new PVH cod=
e.

My point here is that really, are there enough major features that would br=
eak=20
everything to require a new major release every 9 months?

Would 12 months for major features be more suitable and keep smaller=20
refinements / additions as point releases?

With a solid base via testing, there's no real reason why a weekly (or dail=
y)=20
release wouldn't be technically feasible - apart from not having enough=20
changes to justify it ;)

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart6899638.daCjOmCk2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAls87R8ACgkQQa811Xp9
MdzneRAAiVgUzTyXANz05AhUiGqCQ3FG+BqRbemzOw0/wDqRQmAKU9GKn3N91m+l
eTrkU9Owar4UQLUP1M8bC69D4CV+b/d890XNEqQa1z2Q8vSm0DZuIt8Tg6vqnB7A
vwm+xYLQCYqtvYbxYYeS9ZB54pnLosyCXaRtAJ6QWJjrfZcY/nyM543VEdYKJfii
l8bjDH4qrrm8x9/Zpq8dOXJ+WmCMAKdZHjRHSxlNvJpG1AHC3m1w065bQ4dRNW9f
l8aoBnH9xVGMoWjWy3kXt5QNM86JBBhf3S8A4sLwY3j49ERribRxHna3f1p1TDX/
o5vKwVY1698A6s3WJClV/4/3zaW/ysVZ2apOU89R1KNgTf5VmJnha9NKtvALifPR
t7ZK8xrdF7yBeUmNCe6/lRCpGfnIWvltZ6HDzut0IvU8Nf160Y0QintcB/hz+bWi
6O2TH32OLNqixc2d21SB9CB7HFAQA8CANwO387RYbkM2HvBuOEJyNSC4rQFv803q
UAdJCGrTjoCNBZYoQCBPx46/6ME5k7DUg2etorxSl2XQYNdmSSZT4RFA6vKr6juD
bU8DLqEostfezsR1cQPyi3Muvfwqpcr4256VDqd648+uMnZEfCheO9tWodNJZqMC
NClmFNkTPNuQnsyzPUoXllcCp2g8YZaq8NLSb8/vtzSvWw4KtQs=
=v8zM
-----END PGP SIGNATURE-----

--nextPart6899638.daCjOmCk2O--





--===============7098104623206257518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7098104623206257518==--
