From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Sat, 20 Oct 2018 00:41:01 +0200
Message-ID: <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <alpine.DEB.2.10.1810111024390.436@sstabellini-ThinkPad-X260>
 <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
 <alpine.DEB.2.10.1810121035440.436@sstabellini-ThinkPad-X260>
 <CADJ6SV3jk=nnP=6T8R+OuvJH2uQ6uBrLmvudAHkKHP+mN-3hPA@mail.gmail.com>
 <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
 <12a4352a-2fd1-2d04-874a-4a779d18a097@arm.com>
 <CADJ6SV0E=cO3eFyt+meXTtZaoETYxpsHkViMDU=XV9CwNOjP8A@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7219621512916628824=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g1zh=m7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gDdS8-0005aR-7H
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 22:41:08 +0000
In-Reply-To: <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, julien.grall@arm.com, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org


--===============7219621512916628824==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rdxaXnZKF0uQaGjztkjn"


--=-rdxaXnZKF0uQaGjztkjn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-19 at 14:02 -0700, Stefano Stabellini wrote:
> On Wed, 17 Oct 2018, Milan Boberic wrote:
> > I checked interrupt frequency with oscilloscope
> > just to be sure (toggling LED on/off when interrupts occur). So,
> > when I set:
> > - interrupts to be generated every 8 us I get jitter of 6 us
> > - interrupts to be generated every 10 us I get jitter of 3 us
> > (after
> > 2-3mins it jumps to 6 us)
> > - interrupts to be generated every 15 us jitter is the same as when
> > only bare-metal application runs on board (without Xen or any OS)
>=20
> These are very interesting numbers!=20
>
Indeed.

> Thanks again for running these
> experiments. I don't want to jump to conclusions but they seem to
> verify
> the theory that if the interrupt frequency is too high, we end up
> spending too much time handling interrupts, the system cannot cope,
> hence jitter increases.
>=20
Yep, this makes a lot of sense.

> However, I would have thought that the threshold should be lower than
> 15us, given that it takes 2.5us to inject an interrupt. I have a
> couple
> of experiments suggestions below.
>=20
FWIW, I know that numbers are always relative (hw platform, workload,
etc), and I'm happy to see that you're quite confident that we can
improve further... but these numbers seems rather good to me. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-rdxaXnZKF0uQaGjztkjn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvKXX0ACgkQFkJ4iaW4
c+6x5RAA0yWV25JJZLmE4kwjHdTELH1tpcbyoPHw9Sojzw0142XH3Ge8femRZ4mi
DnEsO6eEiJfcZOpMgFcpbIQXriDCEidg9fhQDpbX6rwfBr0ELoA9FtStB6UJsDvP
AQY909JA11a6LY5jhRL1NLEOd3LTXk1oqrYDoGyj+fsR6I5yyUP+grWctVcSzBDb
O2rU3E6LBwinNuZcHQJw0rFKriZa6XhRBZV6mJj50WWNTz7Nn9qjT7mOjdN9YSQh
wrRCfy4bSWjmyQf1goMLvMCa34qt9HtA9GHMSIHDQs+APEDJgrmo5pWQDqA1ZlQa
mFmE/NfgcR1hlizeoO3Uj3SrtXr6w09SU0mT5naGShZXVuH0rQ07zvmZ/K1z97oC
aighViyWRAU0yj1kz2aUE7bp8G2yyyt7WbhNTotQ2h7YWZslsaTZpxdzyZ/WNh8G
XknNoIIQMMHhl1qxZ5v07KG6FwngsALzazIv8i+LVt/Z0Nkrl3W+GHno35P5FuM4
1xnEo0BrepqW3rJP7jPmxglJP1uppTybdeffmbfVLf70yyoICdgybI/wkKDUjT8l
/kqOGwblE9uaoWdRNN2LGNEG3zXl13aEgcJuqfXefpr7fpZrYKJ2Gta/GV0UevSj
o9thlOBXmKM5jNNH1OesudzFBEdLX45Fdm1WLcAajPWVT4D0EWU=
=OuAv
-----END PGP SIGNATURE-----

--=-rdxaXnZKF0uQaGjztkjn--



--===============7219621512916628824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7219621512916628824==--
