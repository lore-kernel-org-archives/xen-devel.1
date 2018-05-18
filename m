From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Fri, 18 May 2018 17:33:44 +0200
Message-ID: <20180518153344.GC11683@mail-itl>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5641046243325812999=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23293.39881.793095.966171@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5641046243325812999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 04:12:09PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: Test for osstest, features u=
sed in Qubes OS"):
> > On Thu, May 17, 2018 at 01:26:30PM +0100, Ian Jackson wrote:
> > > Is it likely that this will depend on non-buggy host firmware ?  If so
> > > then we need to make arrangements to test it and only do it on hosts
> > > which are not buggy.  In practice this probably means wiring it up to
> > > the automatic host examiner.
> >=20
> > Yes, probably.
>=20
> That's not entirely trivial then, especially for you, unless you want
> to set up your own osstest production instance.  However, I can
> probably do the osstest-machinery work if you will help debug it,
> review logs, tell me what to do next, etc. :-).

Yes, I'm happy to help with that. As I've said, the basic test is very
simple (rtcwake command) and already very useful. The fact that it is(?)
broken on staging doesn't make it easier, but I think setting up the
test using 4.8 branch first should be fine.
If you want to talk on IRC about it, just ping me on email first, I
don't have my irc client running all the time.

In the meantime, I'll try to familiarize myself with osstest...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr+8lgACgkQ24/THMrX
1yyScQgAiBv6MWqcMdt05dDoH+YImSpamCqT7XDdtoefM92oDd18Yw+EpDL+fZb7
dgOmNn7xIE5Jr6sxX2jtsu1fWl60W5WMlo9eV5MflAyJA9T45EFY9s+fMBQQpD8K
GIf2dcHRKyEWckreR8XkOpiM9bQ1syVNkrop0pas3LLPLztUGfvAtBXb5HLRlWu9
d4sAjQzwnCpC/ZwVHbsLzDumY81C+R6O7W1Yg/4JlNaCoCZFVhTYIbYIGXS5+7oz
SM9zvi2T0OIQBXg0szI+l07zQsvMfsOPhtXcWkqEbYER9U3KN4hEjbUbuGaQVsF6
i5dyMcYZIHpQYj3hppxaJD/AVwyN3w==
=T/6R
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--


--===============5641046243325812999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5641046243325812999==--
