From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Thu, 08 Feb 2018 18:49:58 +0100
Message-ID: <1518112198.5629.68.camel@suse.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8859196422564786230=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jcc+=fc=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ejqL6-0007Tb-B4
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 17:50:28 +0000
In-Reply-To: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>, xen-devel@lists.xenproject.org
Cc: Marcello Seri <marcello.seri@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org


--===============8859196422564786230==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-G1OYwaAS7cxEwOjpDM2D"


--=-G1OYwaAS7cxEwOjpDM2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-01-30 at 22:55 +0000, Michael Young wrote:
> Xen built with ocaml 4.06 gives errors such as
> Error: This expression has type bytes but an expression was
>  	expected of type string
> as Byte and safe-strings which were introduced in 4.02 are the
> default in 4.06.
> This patch which is partly by Richard W.M. Jones of Red Hat
> from https://bugzilla.redhat.com/show_bug.cgi?id=3D1526703
> fixes these issues.
>=20
> Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
> Reviewed-by: Christian Lindig <christian.lindig@citrix.com>
>
So, with this patch, oxenstord does not start for me.

Systemd says this (sorry, it's not the full output.. I don't have it
right now, but can produce it):

systemctl status xenstored
 ...
 Active: failed (Result: protocol) since Thu 2018-02-08 17:47:56 CET; 12min=
 ago
 ...
 Feb 08 17:47:56 Zhaman systemd[1]: xenstored.service: Failed with result '=
protocol'.

Just running oxenstored from command line seems to exits with 0, but
there's not an oxenstored process running.

Getting rid of what is now commit "make xen ocaml safe-strings
compliant" (df1e4c6e7f8892e950433ff33c215df0cd7b30f7), things work
again for me.

Regards,
Dario

PS. There has been a v2 of this patch, I think, but I don't have in my
emails any longer, so I'm replying to this one.

--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-G1OYwaAS7cxEwOjpDM2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp8jccACgkQFkJ4iaW4
c+700g//d15oF2WM+XQ5kyky6n2QwVRTYPLi9IWKEkZUbWJY+pBrOPzVAnVgNfGT
p7/zWsPSoktT6BUD7HBWCn2f/iSnSBMsVnpkL0kk8OeJ+ywNRZNoAGSD3kr0KlWf
CeKShk569l3SeLvIw1AZ0VyE+Ef3zu5aoMAz/3KiHNjm0RCHA2brb8NtMXh0H1bQ
C9vC6Qu7TVLbtv+6YJLAjf+rFUZiWO+5A7uz7z46mb3zTvjLB5B/sOjQ7nruYdJs
4dFPeC6DNHQYlEpzK0K1RLAODJ6H0eZh8V7gGiNO701j0ogBx0y3KdJk+4IKq+eB
SPv49F7E1vQrLwcrL3rywQLXSlRZzHgRtCzX3Qlz0cOn+6gGoIOFEvMELUYxd3DN
k8vMYgESP54FmLAF/8orwTMUpgJraqZ1rI5X39MNkofIoMGKrAsQZLitdtOu4rTd
e6MmPDU0W2+7oGmhMt1Jfmv0IGzHCIydMHm9H91DP9p5ouCUpwvvYkCAPnXbFAIz
BMciSaWcbliSZicnCP0CvseNlkNMryRHddQnRwqfUnnDvlEZsM3f243J66enukTT
VphRuDTQZrVaft/95rb7mVktzE5KpaXoeaQt8UY9mOCYYdrIkTo/FgdktGlrDt1+
stMD93VFCIsFfWn7kDeYx4cjo6nNUsXQLkpLcjnAlEmwerrS3sY=
=zlOX
-----END PGP SIGNATURE-----

--=-G1OYwaAS7cxEwOjpDM2D--



--===============8859196422564786230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8859196422564786230==--
