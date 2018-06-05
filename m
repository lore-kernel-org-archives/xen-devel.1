From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: Xen Project Security Process Whitepaper v1 is ready
 for community review
Date: Tue, 5 Jun 2018 13:03:50 +0200
Message-ID: <20180605110350.GK23079@mail-itl>
References: <2AF1AB1A-2DFE-429B-8F3B-0153D339EC5F@citrix.com>
 <CAFLBxZYho=m-1owS-KRodVvsirOvvz4pdNq_3bXJB0m+tmJzZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4939285042674237445=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mqkl=ix=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fQ9ks-0003gF-8p
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 11:03:58 +0000
In-Reply-To: <CAFLBxZYho=m-1owS-KRodVvsirOvvz4pdNq_3bXJB0m+tmJzZw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Lars Kurth <lars.kurth@citrix.com>, Steven Haigh <netwiz@crc.id.au>, "committers@xenproject.org" <committers@xenproject.org>, "security@xenproject.org" <security@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Halley <andrew.halley@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ajey Kulkarni <Ajey.Kulkarni@rackspace.com>
List-Id: xen-devel@lists.xenproject.org


--===============4939285042674237445==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline


--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2018 at 11:34:28AM +0100, George Dunlap wrote:
> On Mon, Jun 4, 2018 at 3:55 PM, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> > 2.2.3 B. Git baseline of patches
> > This created quite a bit of discussion and we did learn a few things:
> > * From the thread, having to cherry pick a small (around 5-6) patches h=
ave to be cherry-picked for XSAs to apply to tarballs this appears to be se=
en as OK for most users. More patches are a problem
> > * Recently this issue has become much worse, because some security fixe=
s (or pre-requisites for them) have been developed in public and some XSAs =
required significant backporting to be able to be run
> > * A point release has usually <50% security fixes
> > * There is no appetite amongst existing point release maintainers to ma=
intain a staging branch and an XSA + pre-requisites only branch
> >
> > In other words, we are at a stale-mate. I see two ways around it
> > a) Find an additional volunteer to maintain XSA + pre-requisites only b=
ranches for releases
> > b) Find some tooling/test based solution which exposes issues applying =
XSAs on the last releases of a staging branch for a point release. This is =
a little bit of a half-baked idea, but it may be worthwhile looking into.
> > For example, we could create an OSSTEST, that checks out the last relea=
sed stable branch and applies outstanding XSAs and pre-requisites based on =
the meta-info to it (e.g. via xsatool or a variant thereof). This test woul=
d fail, if an XSA does not apply, which implies that the pre-requisites are=
 incomplete. If all XSAs apply, we can run the full OSSTEST on it. The test=
 could also produce a list of git commits from staging that include XSAs an=
d pre-requisites that can be applied in order. This should in theory - if d=
oable - help downstreams which are struggling with this problem, while flag=
ging up potential issues to stable maintainers early. Any thoughts? Would t=
his be workable and if so, would it actually help?
>=20
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

IMO this would significantly ease handling of XSAs, at least for us.
This does mean we'll need to test things using stable branch (not
previous point release) during embargo period - as the point release
would be available only after lifting the embargo, but I think that's
manageable.

What if at the predisclose time there are some commits in staging (not
stable), which breaks things (in terms of osstest)? Would them be
bypassed (XSA applied on top of stable, then rebase staging on top of
new stable)? Or something else?

> At the moment the release process is quite manual, which isn't
> terrible for one point release every 4 months per supported release,
> but would significantly increase the workload if we did it for every
> supported version for every XSA.  We'd have to invest quite a bit in
> automating that process, which would make it only worth it if a
> significant number of people would find that useful.

Alternatively this could be triggered only if there are conflicting
changes in stable branch, since last point release (but free stable
anyway, to not leak info about the patches). This should reduce
probability of very frequent point releases (the more recent point
release is, the more likely XSA will apply without problems).
This could be determined mostly automatically by trying to apply patches
on the most recent point release.

> The other thing we could probably do is write a tool which would
> automatically determine the minimum number of 'extra' patches to
> backport from the stable branch to allow the patch to apply and build.
> The issue with that, of course, is that such a branch will be an
> artificial branch which has almost no testing.

I'm bit worried about such solution, although this is exactly what we do
right now. With exception that a) it isn't automated b) we do testing on
our own (and probably others do to, duplicating this work).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlsWbhUACgkQ24/THMrX
1yz0Egf/R7UPpqCOhbdE42PgBy3cMBUkLvmz6RHqLrI0dOBSWZqtJfhMx0CR2E9Y
GAtyw1DpQs/gqmkuZXhF3NYo5f+mrwRYyQIpjTozOdYvgRK3kPMPVJhmQwX2sWSW
BFr+vUUIdmnZioCyP8nDgUnsQ+IIln4luKYBYb2xRmlSJOFJSwEQSvIQC5CZk4Mb
AR+uFjM1Clc9dL9fcZXfNPEirujDsyEQgKSA8QbA7kw1B/F84ovg+S2ZlQeTn7ic
FxrUoWwY2LoL1CIb2pKUVRf8YnCN3NPTHD+2e42nPUob4DhydxORmupBATFKcSwj
UgaCrMKPbaozSrzN/qwpD01fSmL9eQ==
=tdi0
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--


--===============4939285042674237445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4939285042674237445==--
