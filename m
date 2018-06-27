From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Project Security Process Whitepaper v1 is ready
 for community review
Date: Wed, 27 Jun 2018 14:05:27 +1000
Message-ID: <5546007.nMA9FcojZc@wopr.lan.crc.id.au>
References: <2AF1AB1A-2DFE-429B-8F3B-0153D339EC5F@citrix.com>
 <CAFLBxZYho=m-1owS-KRodVvsirOvvz4pdNq_3bXJB0m+tmJzZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2864824537030737427=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=chrh=jn=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fY1iC-0006C0-JZ
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 04:05:45 +0000
In-Reply-To: <CAFLBxZYho=m-1owS-KRodVvsirOvvz4pdNq_3bXJB0m+tmJzZw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "committers@xenproject.org" <committers@xenproject.org>, "security@xenproject.org" <security@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew Halley <andrew.halley@citrix.com>, Ajey Kulkarni <Ajey.Kulkarni@rackspace.com>
List-Id: xen-devel@lists.xenproject.org

--===============2864824537030737427==
Content-Type: multipart/signed; boundary="nextPart1958881.goUUcQd4IP"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1958881.goUUcQd4IP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 5 June 2018 8:34:28 PM AEST George Dunlap wrote:
> On Mon, Jun 4, 2018 at 3:55 PM, Lars Kurth <lars.kurth@citrix.com> wrote:
> > 2.2.3 B. Git baseline of patches
> > This created quite a bit of discussion and we did learn a few things:
> > * From the thread, having to cherry pick a small (around 5-6) patches h=
ave
> > to be cherry-picked for XSAs to apply to tarballs this appears to be se=
en
> > as OK for most users. More patches are a problem * Recently this issue
> > has become much worse, because some security fixes (or pre-requisites f=
or
> > them) have been developed in public and some XSAs required significant
> > backporting to be able to be run * A point release has usually <50%
> > security fixes
> > * There is no appetite amongst existing point release maintainers to
> > maintain a staging branch and an XSA + pre-requisites only branch
> >=20
> > In other words, we are at a stale-mate. I see two ways around it
> > a) Find an additional volunteer to maintain XSA + pre-requisites only
> > branches for releases b) Find some tooling/test based solution which
> > exposes issues applying XSAs on the last releases of a staging branch f=
or
> > a point release. This is a little bit of a half-baked idea, but it may =
be
> > worthwhile looking into. For example, we could create an OSSTEST, that
> > checks out the last released stable branch and applies outstanding XSAs
> > and pre-requisites based on the meta-info to it (e.g. via xsatool or a
> > variant thereof). This test would fail, if an XSA does not apply, which
> > implies that the pre-requisites are incomplete. If all XSAs apply, we c=
an
> > run the full OSSTEST on it. The test could also produce a list of git
> > commits from staging that include XSAs and pre-requisites that can be
> > applied in order. This should in theory - if doable - help downstreams
> > which are struggling with this problem, while flagging up potential
> > issues to stable maintainers early. Any thoughts? Would this be workable
> > and if so, would it actually help?
> Here's a question:  What would it take for most downstreams to update
> to staging when a public release was made?
>=20
> Suppose we did this:
> 1. When we predisclose an issue, freeze the stable branches until the
> embargo lifts -- no backports.
> 2. When the embargo lifts, addition to the patches, we release a new
> point release, complete with signed tag and tarball.
> 3. We only do non-security point releases if we go 4 months without a
> security-prompted point release.
>=20
> At the moment the release process is quite manual, which isn't
> terrible for one point release every 4 months per supported release,
> but would significantly increase the workload if we did it for every
> supported version for every XSA.  We'd have to invest quite a bit in
> automating that process, which would make it only worth it if a
> significant number of people would find that useful.
>=20
> The other thing we could probably do is write a tool which would
> automatically determine the minimum number of 'extra' patches to
> backport from the stable branch to allow the patch to apply and build.
> The issue with that, of course, is that such a branch will be an
> artificial branch which has almost no testing.

I just wanted to git this a bit of a prod to keep it current.

Right now, we're at a stage where we could probably justify a new release o=
f=20
4.6, 4.7, 4.8, 4.9, and 4.10 due to the depth of XSAs contained within that=
=20
can't be patched on top of the release archive.

Its actually easier to rebuild packages often with just updating version=20
numbers than do patches to eternity. The kernel packages are one such examp=
le=20
where this can be easily automated to even build / distribute without human=
=20
interaction.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart1958881.goUUcQd4IP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlszDQcACgkQQa811Xp9
MdydNRAAvjQzkk18B4Zp+U78v+S3AkkCuAUlujSzOFiqB3vNYbZYJhgs0APr/ZpV
TqsHY0cCkwKua15AVNnV3LB3nxy59m5WxFEznSYLOerW1RrGSvsRwa+/OBv9j+mH
47EIzLtUGiiim+I2roP1BgezjFfs/BKrT/GGJT7NM8/huXDsYjaSojA9xhTW4sUN
yaPyvW+2QwRx2I1N5suDbuLBjk7R3k9FaREBjrc9LDi3CoRQZsKQvVlYuiF5xqTd
HlbdCqi6bcrjpQjRrFqQ5+a0dzLMPebLPdSEWdxQ/NFgmkOXhJUCD3ROVxvwPMI1
s1OUJpKeolyHKSlJuuC0Lt/jt7c6FrlPljP1muYhsHRJr3Mw/daJ0WyWwIrO8a3a
5sOx/E9nSxWivHs4tvRwqJbpoO7+XDcyKUmzBb8Xs1W1Ihv9HBsELTInYvq2JYdt
mnKpMFOCo0vY91FNITrrO1Sns1fzSB4LzAWy0reTV9Es+FdwnIK1XFbzQlJTDpfE
UpIHeicxopFxxdo3zF9Bk202raZKwNyUqqQjeu8Wxb59ygsjJhpyBhXf8f0TwAHg
iIJHNBFmets2+qZP6RkOTDtjS+Ak+W24GsgA9fIIUVF7d+wIJCycdXbrmPZEg1si
iwmbuOwjLy58j73oTtT5RKtKVIUGbXcdD89ipFjemUk5bYLNuKM=
=ME+T
-----END PGP SIGNATURE-----

--nextPart1958881.goUUcQd4IP--





--===============2864824537030737427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2864824537030737427==--
