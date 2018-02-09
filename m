From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Fri, 09 Feb 2018 11:06:00 +0100
Message-ID: <1518170760.5629.110.camel@suse.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <1518112198.5629.68.camel@suse.com>
 <20180208180348.moi3fujoq22fkkqg@citrix.com>
 <20180208182400.g4qlkiaetnvqhuo6@citrix.com>
 <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2523231114369907231=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=54lt=fd=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ek5Zj-0000IF-L2
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 10:06:35 +0000
In-Reply-To: <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, John Thomson <git@johnthomson.fastmail.com.au>, Michael Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org


--===============2523231114369907231==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SSY1Tp3hTTrxqUztwb6D"


--=-SSY1Tp3hTTrxqUztwb6D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 09:20 +0000, Christian Lindig wrote:
> > On 8. Feb 2018, at 18:24, Wei Liu <wei.liu2@citrix.com> wrote:
> >=20
> > Christian, do you have any idea when you can look into fixing the
> > safe-string patch?
>=20
> Sorry, I can=E2=80=99t make a promise because of my other obligations. I =
do
> wonder, though: this patch did not come out of nowhere but supposedly
> was working - what is different here?
>=20
Well, the only thing that I know about OCAML is that it is, for me as
an Italian, a word a little bit difficult to pronounce. :-D

But I'm happy to try to give some more details on what fails and how,
if you direct me. :-)

The testbox where this happens is a Debian unstable which has ocaml
4.05.0-10.

> In any case, I will reproduce the problem and take a look.
>=20
Andrew said on IRC that he's seen something similar happening on some
of yours XenRT runs... but really, I'm happy to provide more info.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-SSY1Tp3hTTrxqUztwb6D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp9cogACgkQFkJ4iaW4
c+7NWw//XZag7JAX5wyf140T+aTgDrsHoobsx8UtSolplOjQOj01X8ciwDr/S9SV
9tWCE75UZpdEvA1kGx3H+3iGxa942xADnacBDEtRLJ7aCKIQ4MzEGV9xORMJb4ub
dsF62ppZbcWux0+xXe75E1hHfjBUsESa2HiJcWFCsB1Aq0ygJ7fZwUVA0lh6dpkJ
iLbHF9Wbr29sKnfHEcUuehQDDwNGJJKRXPQ6gRkMv4leo2yg4dawOZ+0G1QmAamu
leHJuhO4eVylbQ5B0kQjMKOvwAsztMwWO4kVPerl6wVNSBx6V/JhNNxGovAlR8Xc
P1mTVsChuT8/3lCckocJx8FxPeiv598oXDPaNMJbedGxWob5PmoxDG59buP1wJrX
oyclv06LhBnsFqZ0ZHSEm8RiED6oQ8pcs/H4sU7e8pBO8A7yn2KhHdJ+i+yf0+8j
zG+qlpKzL2IDjgrO4EvbcMKSNDBSr7GvQ7u8Pd+oRNq962U1uzx25kt2caF4J5eH
iwM4asHKavSvS2NLczo7pdudoiXMxu3dJAgQCo8jld88Gsg2VOg4wozUC2IAxLkG
ikTH1HBT7ozWqoOrow9Eqy99txTpqwDwgP7BeU4FGhC9cg595Bfg/GRlQIXOwH2q
0UMKnr7oOSJrE50QCM/oiv7yKKWczPL0g8BHZFvq8DWcWqbk3DU=
=jSoC
-----END PGP SIGNATURE-----

--=-SSY1Tp3hTTrxqUztwb6D--



--===============2523231114369907231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2523231114369907231==--
