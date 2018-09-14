From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Sat, 15 Sep 2018 00:21:11 +1000
Message-ID: <4148872.qM0LCJrPQa@wopr.lan.crc.id.au>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
 <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7482317529163592806=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3mub=l4=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1g0oyM-0005yU-C4
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 14:21:27 +0000
In-Reply-To: <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7482317529163592806==
Content-Type: multipart/signed; boundary="nextPart5719703.KXq8LZaN82"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5719703.KXq8LZaN82
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Friday, 14 September 2018 6:45:35 PM AEST Jan Beulich wrote:
> >>> On 13.09.18 at 18:51, <dfaggioli@suse.com> wrote:
> > On Thu, 2018-09-13 at 17:38 +0100, George Dunlap wrote:
> >> Credit2 was declared "supported" in 4.8, and as of 4.10 had two other
> >> critical features implemented (soft affinity / NUMA and caps).
> >>=20
> >> [..]
> >>=20
> >> Credit2, like credit, has a number of workloads / setups for which
> >> performance could be improved.  Personally I think networking and
> >> partially-loaded systems is going to be more representative of what
> >> Xen is actually used for; so I think credit2 is on the whole the
> >> better scheduler to use by default.  And in any case, making those
> >> improvements on credit2 will be easier than on credit.
> >>=20
> >> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> >=20
> > After all the effort we've spent on this, I'm really, really happy to
> > see this (trying to) happen. Thanks for sending the patch. :-)
> >=20
> > I fully agree with and second George's reasoning, and feel 100% like
> > providing my:
> >=20
> > Acked-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> And that's despite "sched=3Dcredit2 crashes system when using
> cpupools"? While I agree that we shouldn't delay the switch for
> much longer, in particular with there already being a fix available
> from you I think that one should go in before the one here.

Even though my opinion probably isn't very heavy on this matter, I've used=
=20
credit2 exclusively for a considerable time. If you're talking the issue I=
=20
think you're talking about, then I discovered it when doing stuff that most=
=20
people probably wouldn't bother with - evidenced that I hadn't done it befo=
re=20
either.

I take peoples word on the performance +/- of a few percent here and there =
=2D=20
so if its easier to maintain and better code, then yeah - it makes sense to=
=20
move on with it. I certainly haven't found any normal use cases that would=
=20
lead me to object to this.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart5719703.KXq8LZaN82
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlubw9cACgkQQa811Xp9
Mdz0+RAAsXe+6kQc22xvOhEN/AGD6m2n7QHz2cDVhzlVKhd6MBEl0kSyOmDdjm0P
8H1rcuMOxeOe5dsPdJsVpgY4xvRsnwGfhex6YTnNo32q0QHc3TxIPbgPSTE19zsO
47jQgC+3nwKbx9pZEdMIqr8rCR8y3HEBkFaF8Ae4DLZMcrKOpNKj2n+neLRfXAF1
zs3/cbB6taF4QWenc0n14HPVR7NT2/MVSLC3WoIpSBqhnbkiujx9frRgKFoFC3FL
z/s/7w976KB00iLeATF0cEDr32j5VjU8txoBIfL5RcPveaQJpJDzQ17KTS6KC/ms
rpO/lM3ssX1Y9DNamxBIhn812wAnBYAG/z9Fhp0N6+gu2xgidVPwSg+x1eoy7oAS
9FLrbi2251x2YkgQSLxwEL/S2obPWkSYoGspztBIx1j0e/Vw3/bVooS91FqXbTMY
dl4kT4hKAIF0RBC5CpugKTt/HuKfWjJy3+yPzvgEGszG+8r6UHnUviz9+5WHIFW1
gTgS1T/H03nK0FO9jYCoV3gx8+T2R1qgOgKbQoBOgvGZ2Dh9BF8Uw1sqw3UVwOzY
p+GE9Ukztl0ST3SzRhtrYV+xC6Nld50D8dVv5Ap9prqDs81SfR5Fq57352RNuDuf
h2RKqMxnV5kgu3F3BU+WHtuK2CohNbxxEejIBl5RAT2tAhMXHAU=
=AUMt
-----END PGP SIGNATURE-----

--nextPart5719703.KXq8LZaN82--





--===============7482317529163592806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7482317529163592806==--
