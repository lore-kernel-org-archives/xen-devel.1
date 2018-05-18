From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Project Security Whitepaper v1 is ready for
 community review
Date: Sat, 19 May 2018 01:55:53 +1000
Message-ID: <37237830.PBcEiU9Ln4@wopr.lan.crc.id.au>
References: <6011F946-60DB-4EF0-B335-5333D3F56F74@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3099273684255822890=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9mpr=if=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fJhjk-0002xK-Ue
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 15:56:09 +0000
In-Reply-To: <6011F946-60DB-4EF0-B335-5333D3F56F74@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3099273684255822890==
Content-Type: multipart/signed; boundary="nextPart3877014.0rKkxTxfkp"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3877014.0rKkxTxfkp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Lars,

I think this is an excellent start.

A specific concern that I have is when we get into a state between releases=
=20
and XSAs where you cannot take the current release and then apply all relea=
sed=20
/ embargo'ed XSA patches.

The current reasoning for this is that XSA patches are developed on top of =
the=20
staging git branches. While this is still acceptable, I believe we need the=
=20
ability to roll a new point release that will allow end users to be up to=20
date.

Expecting things to always be built for distribution from the staging git=20
branch is somewhat of a hassle - as in the current case of 4.9.1. With=20
publicly released XSAs, you cannot begin with a release of 4.9.1 and patch =
all=20
post-released XSAs.

While this does not seem to happen very often - I would estimate around 4-5=
=20
times in the past decade - we should encourage an out-of-schedule point=20
release. This can be based off the current state post-XSA of the staging=20
branch - but enables reproducable builds at the very least.

Recently, this situation happened with the batch of XSAs before 4.10.1 was=
=20
released, and is currently the case of 4.9.1 + existing XSAs.

This potentially leaves end users in limbo until the next point release rol=
ls=20
around - without rebasing off a semi-random git commit (which is not 4.9.1 =
or=20
4.9.2 - but something inbetween) - or backporting massive amounts of commit=
s=20
to a release.

As this is a somewhat rare occasion, if only a handful of commits need to b=
e=20
cherrypicked, I would see this as fine. If it requires many more, I believe=
 it=20
should trigger an out-of-cycle point release.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

On Friday, 18 May 2018 8:13:55 PM AEST Lars Kurth wrote:
> Dear Community Members,
>=20
> just under 3 months ago, we started a community consultation titled "Xen
> Security Process Consultation: is there a case to change anything?" (see
> https://lists.xenproject.org/archives/html/xen-announce/2018-02/msg00000.=
ht
> ml). As promised, I would collate the input - together with further analy=
sis
> trying to genuinely consider the implications of what respondents to the
> consultation have been suggesting - in a white paper. The white paper is
> attached and contains
=20
> 1) Baseline: an analysis of our XSAs and how we dealt with XSAs in the
> recent past
 2) Results from the Community Consultation
> 2.1) Feedback received from a community consultation
> 2.2) Analysis
> 3) Recommendations and policy changes - some is quite extensive to try and
> tries to evaluate the impact of policy changes, which would result if we
> implemented solutions to issues highlighted by our users.
=20
> The next step is for community members to provide public feedback. If it
> turns out there is a case for changes/improvements, I will condense the
> output of this discussion into a concrete change proposal (or a series
> thereof) to be voted on in the usual way. This may require several
> iterations. Note that the document contains workflow and tools related
> feedback, which I did not anticipate. Some issues highlighted should be
> easy to fix, others will require additional discussion on xen-devel@, such
> as
 * Inconsistent Meta Data and XSA prerequisites
> * Git baseline of patches
> * Release cycle related (issues)
>=20
> The document tries to label all discussion items, such that it is easy to
> comment. I normally attach a converted markdown version: however, this is
> unwieldly in this case, because there is a large number of tables and
> images. Thus, I have created a google doc copy which allows anyone with t=
he
> following link
> https://docs.google.com/document/d/1FbGV4ZZB9OU8SI4b9ntnM-l6NaQLND8Yfd9u1=
1V
> 5Q5A/edit?usp=3Dsharing to comment on sections of the document. If you do,
> please make sure you identify yourself in the comment and/or also highlig=
ht
> feedback in the e-mail thread discussion that will follow this document. =
=20
>=20
> Please also let us know areas of the whitepaper you agree with, as this w=
ill
> make it overall easier to identify how much consensus there would be to
> address specific issues and proposals in the document. Otherwise the
> discussion will primarily focus on points of contention, while other areas
> where in fact there may be consensus, will be missed. If there is little =
or
> no feedback (either positive or negative), we have to assume that people
> are happy with the status quo and that there is only a weak case for
> changes.=20
=20
> Best Regards
> Lars
>=20
>=20
>=20


--nextPart3877014.0rKkxTxfkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlr+94kACgkQQa811Xp9
Mdy88xAAli+bsYt39ZQj6I+gBRGJkWJHXIbRuYG+xiuKAU3RsleqVO2Y5fP0zLtl
ABX7OHM8uxC44QScif9nV3CicZ0YcstVtQ704HH76wW09bza19tsXOwSRde4PMSi
WwnGZGYC1elqI9VdOxHraz6HsNAGIZoJfL6D4jkz5cdSsHjtvp2h0hIRYj4npLmI
orL94BO9KMjpIecvP3SdYIGz/hNho+Bhv+IQerXPMb2kYsNnqO8EQvc61gu4zQrZ
P77oDbiDKtw0dsty036LgFK5XBrOwdn8XPtL1tEVPZR8bD054s6tVnHx16Na2ZNX
phur2E9ratfOxDYJ9W448TevtZqQQOYa0CNwXeX8pkwa2NhRG4/HbQJcEAW/eWRp
EkGn9llTzVx7kOBejzUb/yRoO9rkRoibG4dqHszTnXeLVnzurbDMXmFF/seTe/6m
m3yUKMoMiyo3cBYH3Ml9OG0WYABolmKgxhFjd6fl6Nn3kPH0JJAd2GLCHPaxhIQ9
n1f2N9G4tBUo/ncLtLdxYc3ZT9aQuX1NOBGrUKc193YvSSlCFLRiEhqKti6bT0S7
ppmoEAICpB8w7IcHd0I3lCLIVj16hyCRtoCYja5iKt9OwYAABEq7eXnnWh7LtGT+
wLl5+2UzvMWk7eK15LhsmilrtzcI3xtOC2h6/K0/3P51jn5uJgc=
=jjLp
-----END PGP SIGNATURE-----

--nextPart3877014.0rKkxTxfkp--





--===============3099273684255822890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3099273684255822890==--
