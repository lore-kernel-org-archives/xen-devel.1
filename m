From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Thu, 11 Oct 2018 19:05:19 +0200
Message-ID: <fdb78418317861d775052bc21a9da04387d0e7ce.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <CADJ6SV0_5fSi1YkDYGGSEra4JDPDgu0ZnBfJwsEtv9UY7r6j_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2889565958812462518=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ap2w=mx=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gAePS-0000AV-Rs
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 17:06:02 +0000
In-Reply-To: <CADJ6SV0_5fSi1YkDYGGSEra4JDPDgu0ZnBfJwsEtv9UY7r6j_A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>, Meng Xu <xumengpanda@gmail.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org


--===============2889565958812462518==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-j3X+4jJPK25rRWoO91MK"


--=-j3X+4jJPK25rRWoO91MK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Be a bit more careful about not top posting, please? :-)

On Thu, 2018-10-11 at 14:17 +0200, Milan Boberic wrote:
> I misunderstood the passthrough concept, it only allows guest domain
> to use certain interrupts and memory.=20
>
I'm afraid we totally rely on people with much more experience than me
(and I guess Meng's) on how things work on ARM.

> Is there are way to somehow
> route interrupt from domU (bare-metal app) to hw?
>
Don't interrupt _come_ from hardware and go/are routed to
hypervisor/os/app?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-j3X+4jJPK25rRWoO91MK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu/gs8ACgkQFkJ4iaW4
c+6z6hAA7zy5tmkeDyuHnDrM7m22IOn9BJSA2Z96IRws/POBw4+B+NH3LjrASIZx
pew6a4PhV8Sn3j1C9CI1XMj3Ir+K9TxwZNqELozbINwhhBSc47lXcTBaQlv1w9xQ
80KzTRktbR/99kkCy1XlLXLz0qOrBw+WHW3WBqEPgFAcv4UYlO6sRvhmWJ9gT5qk
TempPhtTD+bBuTjoN3Cky45eui4zqKWn8K65YLoO5kKXmS+S2q5PLN869SrOXBST
2ODhc8qnbqkGqA7H3xXdjQuY+6TcoyRR/XxoicwwdN4fb7JM49fsRn/Hg9kawzx9
OxsGCmnKh8x14KdgJgcZtDPMd73PQAkueIYd9fMt3aFcSjC84l5+HjxUoFHRWRKB
VybNv3m1pHRJ+uTwRdkgIwQBW/300s8nm1oIDOy9avKVgPj8mNvOIuoTh4fents6
R8EJko9/nMijJbDBKeJFOsnBLCQXUnd5n8HYdSRjHCuBtMKZqdXdnWOMAJB/arwi
qaG2/jevlcUFKU8WCBqWIHySrs/8bObyPlnm/U3ioamIWg0pcMFilDnWaaudncdd
QsbeOYIxEQ+mKG/TlH4OIXZZRe4HHnLGB1C123JhIbOshJwkf7OZUFmESCfuQC84
xWvL0XcAYHDdGN2WPZcSO4/ovwhlJepDpMJEntE5fRLYamBNfQ0=
=TIHX
-----END PGP SIGNATURE-----

--=-j3X+4jJPK25rRWoO91MK--



--===============2889565958812462518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2889565958812462518==--
