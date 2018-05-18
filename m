From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Xen Project Security Whitepaper v1 is ready for
 community review
Date: Fri, 18 May 2018 19:53:34 +0200
Message-ID: <20180518175334.GB2731@mail-itl>
References: <6011F946-60DB-4EF0-B335-5333D3F56F74@citrix.com>
 <37237830.PBcEiU9Ln4@wopr.lan.crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5347969626168164213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abm/=if=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fJjZU-00072s-HO
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 17:53:40 +0000
In-Reply-To: <37237830.PBcEiU9Ln4@wopr.lan.crc.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5347969626168164213==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 01:55:53AM +1000, Steven Haigh wrote:
> Hi Lars,
>=20
> I think this is an excellent start.
>=20
> A specific concern that I have is when we get into a state between releas=
es=20
> and XSAs where you cannot take the current release and then apply all rel=
eased=20
> / embargo'ed XSA patches.
>=20
> The current reasoning for this is that XSA patches are developed on top o=
f the=20
> staging git branches. While this is still acceptable, I believe we need t=
he=20
> ability to roll a new point release that will allow end users to be up to=
=20
> date.
>=20
> Expecting things to always be built for distribution from the staging git=
=20
> branch is somewhat of a hassle - as in the current case of 4.9.1. With=20
> publicly released XSAs, you cannot begin with a release of 4.9.1 and patc=
h all=20
> post-released XSAs.
>=20
> While this does not seem to happen very often - I would estimate around 4=
-5=20
> times in the past decade - we should encourage an out-of-schedule point=
=20
> release. This can be based off the current state post-XSA of the staging=
=20
> branch - but enables reproducable builds at the very least.
>=20
> Recently, this situation happened with the batch of XSAs before 4.10.1 wa=
s=20
> released, and is currently the case of 4.9.1 + existing XSAs.
>=20
> This potentially leaves end users in limbo until the next point release r=
olls=20
> around - without rebasing off a semi-random git commit (which is not 4.9.=
1 or=20
> 4.9.2 - but something inbetween) - or backporting massive amounts of comm=
its=20
> to a release.
>=20
> As this is a somewhat rare occasion, if only a handful of commits need to=
 be=20
> cherrypicked, I would see this as fine. If it requires many more, I belie=
ve it=20
> should trigger an out-of-cycle point release.

I second all of the above. Having to figure out prerequisite patches (or
adjusting patches to be applicable over the last point release) was an
issue in the past multiple times. In some cases it isn't such a big
issue, but there are also difficult ones.

Alternative workaround for this would be more frequent point releases by
default (maybe with ability to delay it very few commits are queued).
For example every 3 months. It wouldn't solve all the cases, but I think
will make it easier most of the time.

As for the other points:

2.2.4 / 3.2

IMO 9-month release cycle would make sense. The current one is also an issue
for us, as we freeze Xen major version multiple months before the release, =
so
the short release means we're already behind at the release time. This affe=
ct
for example backporting patches - like with Meltdown, patches for older
versions were available with the delay.

3.1. R2

I mostly agree with Jan here. For Qubes OS, 2-week pre-disclosure time is
enough even for large batches, and I'd rather avoid artificially delaying X=
SA,
especially those with major impact (whatever definition would be used). But=
 I
see this might be an issue for other XSA consumers, so some flexibility for=
 the
Xen Security Team here would be fine.

BTW The solution 1/2 comparison table have "Public releases by
downstreams" row swapped - solution 1 imply 2 public releases. And I think =
the
same in "Per batch cost".

3.1. R3

Fixed schedule indeed would help with some of the issues, so I'm
slightly for it.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr/Ex0ACgkQ24/THMrX
1yzWiQf/Sarm4bHmNYGfe6Wmafeqx5FqFhS17ybcntEXW5391he0kKHDEEEk/bxw
7vBQaEnEkEYysaF6mf1arZV1bD4Cjs4cF8E+G0I6mH0irm5HEqWFMBqY2DSuDyaj
4WrTN+9FY1o2+Wxt/cIQ26kms4JXyN+KSzg/NqcEywXLgOKIlTb0sSAAvjqsu28n
bDgsKDM0g0n9o2JdhSqw1AoRmUdiU2jxlinlUux8/2HLE4+Wm7BTpnfZZBI6LqZ9
4TXqjBXQM1W6kc+oBhXuvV5eFDhk596t3wWhs9q59NOTzgf4wV6oh9R+GBPPCEUX
HZvJLJWzJ+QznOotZzAdwb6fj2WC+Q==
=hT0v
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--


--===============5347969626168164213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5347969626168164213==--
