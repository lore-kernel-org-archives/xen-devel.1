From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Mon, 21 May 2018 13:49:45 +0200
Message-ID: <5c2a2ec2dcf22598af90bba788140170c4a52dc2.camel@suse.com>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5366357950381623866=="
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
To: Ian Jackson <ian.jackson@citrix.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5366357950381623866==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JH+3W9HzrnrstOm8cYO4"


--=-JH+3W9HzrnrstOm8cYO4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-17 at 16:12 +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: Test for osstest, features
> used in Qubes OS"):
> > On Thu, May 17, 2018 at 01:26:30PM +0100, Ian Jackson wrote:
> > > Is it likely that this will depend on non-buggy host firmware
> > > ?  If so
> > > then we need to make arrangements to test it and only do it on
> > > hosts
> > > which are not buggy.  In practice this probably means wiring it
> > > up to
> > > the automatic host examiner.
> >=20
> > Yes, probably.
>=20
> That's not entirely trivial then, especially for you, unless you want
> to set up your own osstest production instance.  However, I can
> probably do the osstest-machinery work if you will help debug it,
> review logs, tell me what to do next, etc. :-).
>=20
I'm not sure what 'non-bugs' in the firmware we're talking about, but I
problem I had when trying to do something like testing S3
suspend/resume in osstest, was that most server class hardware I could
find, did not support that.

If that's the bug you're talking about, yes, I agree it's not trivial.
:-) (although, I did not actually check the boxes in the MA colo, they
were just servers from Citrix's lab).

There's a (non-perfect) workaround, though, as George suggests, which
would allow us to run a "quasi-suspend" test at every flight on every
hardware.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-JH+3W9HzrnrstOm8cYO4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlsCsl8ACgkQFkJ4iaW4
c+7+mg//YQISYIPFwvoT/ECPfXg5GYhr9UpcWB2ZLMzw4T4VUiSThMy27nAc9vXZ
ivohcrxEY1l89RsQ5yVClehPdgM6FSm4btnAzEePuijEKtpLKebp6Jto9AQJVoLH
vq0d/3/REojgMJ+r3ngkXMfdethnJtn4GXv+nAm6JQ1BvZGZkWm/b9tNE4gNMNwK
yPbfoXK6Gtwb5BdABxoErnVAMyp7mQWSKuJ/s/bydaUZsbOuj1PtnVL5tEQwAKCR
VOTauB44G/ya4eUUNbRm/2h3BgJQRoYirK7XfFeEXjDBzi1ny4+TrpmSqgtpA+11
H/cEYw1ZoJW+R2DlGfm9sNpa2vTRmQVrQa4UmX7RcBhx6LMzyvFxJvEdSY1TgGM5
t8PzNoOaYe9b09qUkEee8onBvryI5lpa4BSRr5uBe1Lmcxgjy0DK7SZwUT9oQWoE
d+23PlIXxVpQsICO2fgAoSRNfKYF1mM2GsZz9/+7RQkQg6/crBsFaQ6SUN7BgAEY
Rb2IwGvZvQXE7ciK/MeseclsC/WKXxBns7pWSdIRqh/ZA1M9BgrLgQwRUcOe0u98
FgJnhZFd9lvxreuZAZUaspieLx12ayTwF4J0XOOrqFkz3pX+CiAMDOjolGF/EO2/
hdqyXvZWDtqTgDRH1rGc1NfxOAH1e9vBfcxfZWRbb1QOe8cKP0o=
=8m8c
-----END PGP SIGNATURE-----

--=-JH+3W9HzrnrstOm8cYO4--



--===============5366357950381623866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5366357950381623866==--
