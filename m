From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Mon, 21 May 2018 13:52:15 +0200
Message-ID: <b713974db1f90fcf450ce232761dab0defb3ee8a.camel@suse.com>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <CAFLBxZbubeqBGJ3=qhzxKVoQGakyaY2Hi8dMfXz+QeGLtZZeNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0065334788697761467=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZbubeqBGJ3=qhzxKVoQGakyaY2Hi8dMfXz+QeGLtZZeNA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, Ian Jackson <ian.jackson@citrix.com>
Cc: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============0065334788697761467==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VEjlm+qXlhokfzaZSahL"


--=-VEjlm+qXlhokfzaZSahL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-05-21 at 12:04 +0100, George Dunlap wrote:
> On Thu, May 17, 2018 at 4:12 PM, Ian Jackson <ian.jackson@citrix.com>
> wrote:
> > That's not entirely trivial then, especially for you, unless you
> > want
> > to set up your own osstest production instance.  However, I can
> > probably do the osstest-machinery work if you will help debug it,
> > review logs, tell me what to do next, etc. :-).
>=20
> I'm pretty sure it would be possible to test the Xen "get ready for
> suspend" and "resume from suspend" functionality without actually
> needing to interact with ACPI -- we just get it to the point where it
> would start interacting with ACPI, and then have it return instead.
> From a "I'm positive this will continue to work" point of view it's
> not as satisfying as actually doing the suspend; but from a practical
> point of view, it will catch the vast majority of bugs in Xen (as
> opposed to hardware-specific quirks); and it will run on any hardware
> (which means not having to do reliability testing).
>=20
> IIRC Dario actually had a patch for something like this for his own
> testing at some point -- Dario, anything to add?
>=20
Indeed I had a patch (it's originally from Ben, actually). I sent it,
so it can be found in list archives. And, in any case, I still have it
around and can resend it.

I did catch quite a few bugs with it back then.

> What if we 1) have two versions of the test -- "Fake suspend" and
> "Real Suspend"; 2) only run "Real suspend" on hardware specifically
> marked as having a suspend that works reliably; 3) default all
> hardware to 'false' until we do some testing to find out how reliable
> it is?
>=20
> That way we get suspend testing 95% effective as quickly as possible,
> and we can complete it as we have time.
>=20
That sounds a very good plan to me, FWIW.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-VEjlm+qXlhokfzaZSahL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlsCsu8ACgkQFkJ4iaW4
c+4XZRAAgM8/aH+r/8Pc2hrnsI+F/DokJEPSETp2n68oYvP9U150iZvZaKE5lSx1
H2lpRrZt5rg73aDzttLKm/NNp3oMjVc/C4FNZhX/CKCbAZRm02NTjIZJ+0o1yN7u
ZAlOk8YPlW/R1yTGdX+zXcFaGxRRXcWF5RzEm63qa+G0W69dDMKonZPQxRU1gZ8w
4eM/Id0tyoWPhQQ0aJw5uMiZnxgWniKcFPcC9LnAILhwb2uv6of5QvFQOCs+WpVg
WKipbdFB2NzelZsBWouzQdPXcckYK0AkUXfBSk7gKsjTubjpEsn9bNoHQvol/ZUI
WxG9xj+3xbuPVQ6d3FEvvRTIZ49SA8qexP5acdd7vzibnX+7RPOwCiSkxwOGWc/x
nLWvByaDfUFDE9gcnJfKx5nnmtyuDsWnAO3654381pWYrT5o+6lPTR80Re6lvGgP
GhU8FEO19XSP5EIyLrERhLKSTWnQq0SuRdT84y1V/ng85dYE9eoSOY7GuCMs96/r
PaveY4OofZZEpJTzwimlZcKgzPx4LnCn7OOjlbTP4oH5REYH+2Pfwx/VLyD5j7YU
PNW1OASnqFUhPBKsoxAxzIt0VjZsOd82yuvlX7pd3C58wtCkKY/GQO5qH7Mr7bhm
lEg7tsrxU5xqQFVLq77yWlP+3bk7XecQOWiDkNQum5+FR2br51Y=
=yqIS
-----END PGP SIGNATURE-----

--=-VEjlm+qXlhokfzaZSahL--



--===============0065334788697761467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0065334788697761467==--
