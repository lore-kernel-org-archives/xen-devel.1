From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/5] formats: print time values as decimals
Date: Wed, 12 Sep 2018 19:43:21 +0200
Message-ID: <24ef5f32130e512a8cba4f9abdcd8455cb4ec43d.camel@suse.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-6-git-send-email-andrii.anisov@gmail.com>
 <34420b79-4e2a-6ae4-7838-039e6dd7ee94@citrix.com>
 <6d9633125b46460c8200c848c81212cba34b9a04.camel@suse.com>
 <48397450-7b3e-35fd-2314-76a4f59bfe6d@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7823144302434236569=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g09BR-00067f-Am
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 17:44:09 +0000
In-Reply-To: <48397450-7b3e-35fd-2314-76a4f59bfe6d@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============7823144302434236569==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zcTo+WeNeKs1RYIZXCDC"


--=-zcTo+WeNeKs1RYIZXCDC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 20:28 +0300, Andrii Anisov wrote:
> On 12.09.18 10:54, Dario Faggioli wrote:
> >=20
> > Or, in general, what I think would be useful, is to have the
> > timestamps
> > and the scheduling parameters in the same domain (when possible).
>=20
> As I understand, now we do have among scheduling parameters:
>      - credit's tsclice in ms, rlimit in us, migration delay in us
>      - rtds'es period and budget in us.
>=20
> I do not think it worth to add more zeros to those parameters for=20
> converting them to ns.
>=20
We're still speaking only about printing right? IAC, you're right, me
saying "scheduling parameters" was a bit too generic.

What I care is to be able to, when looking at a trace, compare/relate
the time at which a particular event occurred (i.e., the timestamps)
with budget and absolute deadlines --as far as RTDS is concern-- and
with credits --as far as Credit 1 and 2 are concerned (and also with
remaining cap budget, for Credit2).

In fact, that is what you need to fiddle with, in order to understand
whether events are occurring when they are supposed to.

Those other global and (almost) never changing parameters you're
mentioning, are less of a concern, and we can print it in whatever time
unit we want (as far as it's possible to tell which one).

> IMHO trimming timestamps from ns would not be accepted, as well.
>=20
No, let's _not_ do that! :-D

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-zcTo+WeNeKs1RYIZXCDC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluZUDkACgkQFkJ4iaW4
c+62yxAA5wz17foh1BHaCaaGfpczztUEE5ZtEgdsRGoFOK/UHADVuYxIdcf2Spul
QmxOJzJZqXwoG1dI4AbMalFBtgdbkq2xbz7V9YgAibOUwQW/0TAZaLWq0+uTB7Ge
aQ529IGf/brt+cCIQfmn0lRJMNQBgHaDmrVO+6dc/qNGHbB6yIK2Dj9HvN5OCjo2
N/oZJ4Z4lyXPEMeb9I7wb3E3FxmsX84ah3kukDFC2gTN3P4dBDODT0F2gcpe+15g
0RKDuVcyPqIRPOqWpLPjtwYS52HllRO8M/pg0XqV8aU9tmqDx41/Y0j6bMuTShNj
eCMpWEU9G0Q/1yhZJtq0ppIA0Vx6kxsWIgI/Oy7N1p5FrdufrECeBCyiT1vcrB9C
HtI4j8SFM4JUL8IS9KziMt2RgMbYGFlvmyM/FVgaBqcFPAu8fziXce9aTuUvZmAe
9vBweGGtKuEP4RD1FMHyt3SDYyZuzh/9/zfsIKP3RnKxszBlsATfKK8OP8dU7veS
DZoIpfkwXJWwkCBZkmfTYZVnk/cW1FRprsXlRwj5YrcUtLa3+P4L38HhqWPINkTZ
dwA2ZpaBrtfA4enBF0befsqy0VehOLB19IQnpftyW44bCQOTDQPmyNl39CsnBgFK
ZrV10wjaIO+NE2OUcYgAuFxzZKa2VLaqHnGJva+DWLnnVkJMc6k=
=cu26
-----END PGP SIGNATURE-----

--=-zcTo+WeNeKs1RYIZXCDC--



--===============7823144302434236569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7823144302434236569==--
