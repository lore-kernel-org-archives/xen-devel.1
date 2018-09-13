From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RFE: Detect NUMA misconfigurations and prevent
 machine freezes
Date: Thu, 13 Sep 2018 13:49:15 +0200
Message-ID: <26834ac4f406f240b8b0c46994535e6a33f0e440.camel@suse.com>
References: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
 <29fc38c6-8908-2f6f-e496-a1644f56c59e@suse.com>
 <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
 <2d2f115d3f45d76ea439a1b36df9953a3b979aca.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7204716364333322960=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0Q82-0005wu-MF
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 11:49:46 +0000
In-Reply-To: <2d2f115d3f45d76ea439a1b36df9953a3b979aca.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============7204716364333322960==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fgndkkfd5fOnNtFIZZWP"


--=-fgndkkfd5fOnNtFIZZWP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 17:13 +0200, Dario Faggioli wrote:
> On Thu, 2018-08-30 at 14:01 +1000, Steven Haigh wrote:
> >=20
> > Add the CPUs:
> > (XEN) Adding cpu 12 to runqueue 0
> > (XEN)  First cpu on runqueue, activating
> > (XEN) Removing cpu 12 from runqueue 0
> > (XEN) Adding cpu 13 to runqueue 0
> > (XEN) Removing cpu 13 from runqueue 0
> > (XEN) Adding cpu 14 to runqueue 0
> > (XEN) Removing cpu 14 from runqueue 0
> > (XEN) Xen BUG at sched_credit2.c:3452
> > (XEN) Adding cpu 15 to runqueue 0
> > (XEN) ----[ Xen-4.10.2-pre  x86_64  debug=3Dn   Not tainted ]----
> >=20
> That's not a debug build, though.
>=20
> It would be useful to test one such build (as suggested by Juergen),
> to
> see if any of the existing ASSERTs triggers.
>=20
Ok, ignore this.

I have identified the problem, and I'm in the process of sending a
patch (to which I'll Cc you).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-fgndkkfd5fOnNtFIZZWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluaTrwACgkQFkJ4iaW4
c+6cqA//b6LEq2KLiWPKCpcBmVdWzawUzcCzwMnJu7yIco2vJzieKEMxRP2ywEla
/J+08vERxk1YcCsl/o1wcXOrIhvzsjVf+SXJeOXBRZTBAmd6BjWh8KxEV/sr3j10
qkwQHGnRDphx1fa8I6DhtWzoGa8Nyd+hVDmnil02K4YumZr2lKBbM5Oc+0s1MUK+
mojS0wxTLGuQyWCaThBx0SGVnBrrUkztUtCPWEUKSXkzQZeNYGAdE36Yp3wxz3gr
C0OI/nWj3K7vRcwUpQBVvGCVCWCtMG8KYiUtKQAAbKIBQ5Kkl7XHuWnTga0ym8UQ
MjfH3eNY9J9c7fGePq8IcCROU96HWaQeNwRTxdQc/9rpBWYRSKopvNwpFeWTAYUM
XkUH2GN5MJL0jHeOYw2zxSEojEiIHtETJ5So/70W9TbTLMaq1xT3p2cAZv4xyFuj
OCJ4c9UlIUGhS1EQl+QysWxJNSgNiaaWMywR6oQoGRHt+pkhDXPEENyofl50NKx6
C1dY33i3eJP18f2Af3133OyHAu5JO+CRDXp57kuHm9P7zRR3T4C/N2Y4rsFXF4LL
bA5+/+/CTvo6rA5g5ljaRfDzhgyAjrzjfqsoT72ONp9U6+K2ZvkSOTbVCseXEMap
1xYwns/aFpBOTWCxCPkQ2dTyPrRlrVkjfxmzG+5A8ZdaOhCFjQE=
=Dnm9
-----END PGP SIGNATURE-----

--=-fgndkkfd5fOnNtFIZZWP--



--===============7204716364333322960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7204716364333322960==--
