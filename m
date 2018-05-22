From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Tue, 22 May 2018 09:51:46 +0200
Message-ID: <da85648bddae3bd73a4dc09c2aa507a0d08d6859.camel@suse.com>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <CAFLBxZbubeqBGJ3=qhzxKVoQGakyaY2Hi8dMfXz+QeGLtZZeNA@mail.gmail.com>
 <b713974db1f90fcf450ce232761dab0defb3ee8a.camel@suse.com>
 <23298.53323.921955.538239@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6250476990725976712=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23298.53323.921955.538239@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <dunlapg@umich.edu>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============6250476990725976712==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-K6YhiVB3CEfiiZBRuEYR"


--=-K6YhiVB3CEfiiZBRuEYR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-05-21 at 14:57 +0100, Ian Jackson wrote:
> > On Mon, 2018-05-21 at 12:04 +0100, George Dunlap wrote:
> > > What if we 1) have two versions of the test -- "Fake suspend" and
> > > "Real Suspend"; 2) only run "Real suspend" on hardware
> > > specifically
> > > marked as having a suspend that works reliably; 3) default all
> > > hardware to 'false' until we do some testing to find out how
> > > reliable
> > > it is?
> > >=20
>
> OK, for starters, how about we add the fake suspend test to every
> flight.
>=20
> Do we want or need to do that test with a guest running ?
>=20
Doing it with a guest running would be more complete, I think.

I think the best would be to do both, i.e.:
- suspend without any guest
- (when resumed) start a guest
- suspend with a guest

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-K6YhiVB3CEfiiZBRuEYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlsDzBIACgkQFkJ4iaW4
c+4avxAAmFkeB0DSfyI6HoT0iHxp0lTdo7b4a7qLeTKSWHLjcNDXaYg2imisd2tX
bup5c1sEfSKsgJ/W/LdHPqBqBASXqVl3jIcPfHZsGmxsZVDm6V011fWeBPnMwB7V
t6EZWfYvDWd9p7rLnjPjOjiBI1XiFkOEcVKGmZp0jMqEyL1wQ22iVzur9DqvwG/S
6ZDvEr6R5DxreOfJrbMrBAavVbHE6qschXI6ULLgoqab/mHngZ5Cq6YjyCSBsw0k
Y1jwxKfX3/VawXwLsGXcRIiTIgMSlyTyTyDpNNAAZd8Linf6WawhS2bFxAEymph6
F3HwJzWO+NsIRSv6jDhymoj9Lm9oMT5ctAgF7nD4e58EuHZ0xK2Y1+qMAHAatKxZ
iJ7PHjwONlYV8pdOH7Th3ePLegKipUSOnWTe09eka4DpyVLQ8M17nuTj32qC9p+f
3sGloUEYpwFhfomk97/yHHSXB6ebz7dhWegYAkQ/bBKu1AnYsZ2tnDTLZe8QAKRb
x5VqdBQG/Gk36+5by96rkgk18qNIzMDYWN/hwdEd0TND50d/g/dOcd2gLM5NJ5Ad
YwjynMZ6PFwtp8Vi3pyI7C9xfh5q+zfqM7DRff75ppLVz5AQveqlat3xdmGkxwAX
ytGzB/8K/GrXHoD3s5KLpr9nnl9hsuEBmV9KwVQ3sIWsMNfPMfs=
=Hkim
-----END PGP SIGNATURE-----

--=-K6YhiVB3CEfiiZBRuEYR--



--===============6250476990725976712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6250476990725976712==--
