From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: Xen Project Security Process Whitepaper v1 is ready
 for community review
Date: Tue, 5 Jun 2018 14:07:57 +0200
Message-ID: <20180605120757.GL23079@mail-itl>
References: <2AF1AB1A-2DFE-429B-8F3B-0153D339EC5F@citrix.com>
 <CAFLBxZYho=m-1owS-KRodVvsirOvvz4pdNq_3bXJB0m+tmJzZw@mail.gmail.com>
 <20180605110350.GK23079@mail-itl>
 <5B1677B002000078001C8417@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2024301244358402833=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mqkl=ix=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fQAkx-00042E-SM
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 12:08:08 +0000
In-Reply-To: <5B1677B002000078001C8417@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>, committers@xenproject.org, security@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Andrew Halley <andrew.halley@citrix.com>, Steven Haigh <netwiz@crc.id.au>, Ajey Kulkarni <Ajey.Kulkarni@rackspace.com>
List-Id: xen-devel@lists.xenproject.org


--===============2024301244358402833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline


--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2018 at 05:44:48AM -0600, Jan Beulich wrote:
> >>> On 05.06.18 at 13:03, <marmarek@invisiblethingslab.com> wrote:
> > On Tue, Jun 05, 2018 at 11:34:28AM +0100, George Dunlap wrote:
> >> On Mon, Jun 4, 2018 at 3:55 PM, Lars Kurth <lars.kurth@citrix.com> wro=
te:
> >>=20
> >> > 2.2.3 B. Git baseline of patches
> >> > This created quite a bit of discussion and we did learn a few things:
> >> > * From the thread, having to cherry pick a small (around 5-6) patche=
s have=20
> > to be cherry-picked for XSAs to apply to tarballs this appears to be se=
en as=20
> > OK for most users. More patches are a problem
> >> > * Recently this issue has become much worse, because some security f=
ixes=20
> > (or pre-requisites for them) have been developed in public and some XSA=
s=20
> > required significant backporting to be able to be run
> >> > * A point release has usually <50% security fixes
> >> > * There is no appetite amongst existing point release maintainers to=
=20
> > maintain a staging branch and an XSA + pre-requisites only branch
> >> >
> >> > In other words, we are at a stale-mate. I see two ways around it
> >> > a) Find an additional volunteer to maintain XSA + pre-requisites onl=
y=20
> > branches for releases
> >> > b) Find some tooling/test based solution which exposes issues applyi=
ng XSAs=20
> > on the last releases of a staging branch for a point release. This is a=
=20
> > little bit of a half-baked idea, but it may be worthwhile looking into.
> >> > For example, we could create an OSSTEST, that checks out the last re=
leased=20
> > stable branch and applies outstanding XSAs and pre-requisites based on =
the=20
> > meta-info to it (e.g. via xsatool or a variant thereof). This test woul=
d=20
> > fail, if an XSA does not apply, which implies that the pre-requisites a=
re=20
> > incomplete. If all XSAs apply, we can run the full OSSTEST on it. The t=
est=20
> > could also produce a list of git commits from staging that include XSAs=
 and=20
> > pre-requisites that can be applied in order. This should in theory - if=
=20
> > doable - help downstreams which are struggling with this problem, while=
=20
> > flagging up potential issues to stable maintainers early. Any thoughts?=
 Would=20
> > this be workable and if so, would it actually help?
> >>=20
> >> Here's a question:  What would it take for most downstreams to update
> >> to staging when a public release was made?
> >>=20
> >> Suppose we did this:
> >> 1. When we predisclose an issue, freeze the stable branches until the
> >> embargo lifts -- no backports.
> >> 2. When the embargo lifts, addition to the patches, we release a new
> >> point release, complete with signed tag and tarball.
> >> 3. We only do non-security point releases if we go 4 months without a
> >> security-prompted point release.
> >=20
> > IMO this would significantly ease handling of XSAs, at least for us.
> > This does mean we'll need to test things using stable branch (not
> > previous point release) during embargo period - as the point release
> > would be available only after lifting the embargo, but I think that's
> > manageable.
> >=20
> > What if at the predisclose time there are some commits in staging (not
> > stable), which breaks things (in terms of osstest)? Would them be
> > bypassed (XSA applied on top of stable, then rebase staging on top of
> > new stable)? Or something else?
>=20
> I don't think we should get into the business of re-basing any of the
> main branches of xen.git. If anything, then merging. But I further
> think we also shouldn't break the strict staging -> stable workflow
> with the osstest push gate in between. Some delay between public
> disclosure and release of the new stable version will hence be
> unavoidable. (Just take the current situation as an example, where
> we're blocked on an osstest issue [according to my investigation, at
> least] with two stable releases - we simply have to wait for the
> osstest issue to be dealt with first, and for the pushes of the
> branches then to eventually happen.)

Makes sense. Does it mean in all the cases point release would happen
with a delay from XSA public release? How long does it take for osstest
to push things (assuming no problems)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlsWfR4ACgkQ24/THMrX
1ywijwgAmMPAIvTYAgKX3cPeEOvso7ctJQFBZujDbzkVXm9oGYryuR7zase+JAeX
echblIg6CMvCHgIBEKt3KhglefMUNUzWn+X+alhEpdUgxYcqkXMfAUcDMXctZAiV
J+MVjuKqmOM3HrYdd3Scgo2U+ZdDnGNddl1szyGs9EaU/IJqdq6UbHvxNoGGeJGl
O/BemU6JMcfwZgjui4ccKEPJSRJq0E1uSkhjlW+SsAxFCK1Sk4cSOpolmb82hCir
o91a/RHY1C/lCXLdoGSl11o+FdXwJqswpxffLRkc1DPq9TI7/Ja6l8lHEODymj9J
j05wxe4i6QF8/5063BvyuNihKjpvYg==
=mtjT
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--


--===============2024301244358402833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2024301244358402833==--
