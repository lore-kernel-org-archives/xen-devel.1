From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Tue, 11 Dec 2018 17:56:22 +0100
Message-ID: <a53d1bd000d3c6af44ed02997d0484405875aab2.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
 <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
 <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
 <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
 <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6445717311575062890=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lcZS=OU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gWlK8-0006cy-O6
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:55:56 +0000
In-Reply-To: <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii.anisov@gmail.com>, Julien Grall <julien.grall@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org


--===============6445717311575062890==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TJU8gLNWZOD8scOkB5hi"


--=-TJU8gLNWZOD8scOkB5hi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-12-11 at 12:27 +0000, Julien Grall wrote:
> On 10/12/2018 12:23, Andrii Anisov wrote:
> > On 10.12.18 13:54, Julien Grall wrote:
> > > What are the numbers without Xen?
> > Good question. Didn't try. At least putchar should be implemented
> > for that.
>=20
> I think we need the baremetal numbers to be able to compare properly
> the old and=20
> new vGIC.
>=20
Agreed.

Also, what about Xen numbers, sched=3Dnull.

I don't expect much improvement, considering pinning is in-place
already. Still...

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-TJU8gLNWZOD8scOkB5hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlwP7DYACgkQFkJ4iaW4
c+5wVQ//Ypp0FYQm7F9aUDvohmQ6eIt7MxIZHbvEkdvT4Xj4YIJZQ5AWACXpLmce
v+Xu/evoVEbxjHwZgMywYabXVb+C+8kkLSvkiSlTXeUfl4F4zPk9NjGHYg86SHTv
1EaJkQtltOFTaoS7KGaKOZs8aulmsutpbyTp3hViJlwvEycOysDKal6ke0aAxImH
lq9BlWVWHEuWiMK/E/VjwaH7gKisQiYbOkLoCgb3Mm3ywLx8taYOq0e2gt0JiR4N
dMomJV5pj1dh2YxKSEJIdjQTAETf5zDqXA1SR7ucHJyWGDkgeAtpVNtmBG1xzEa8
6ThKEzUPiU/K9qMqVuKnTdt5SEGCdp4JV5+svLAC6zqX7k1u+qJZvCwzX9BD146K
wEJI52eBK+FtiarJVzBS4KYboODRLz6rYRO3ccvQJw+8cHrZPu8QAdOEsHH7ELTi
dDsH9NZIld64eIra+WbarXFka+G0Oa43lBIsoD/V1FeMCrTwvs3KNa+du8CHPxi6
Six1D7yXjeL+T2czKh0xCz6i0kR0bF1u2aW3Y/KHnQHR5sb+LiLbFDpL1Z9PU/+P
HXFwEjYlrPYeS5cHSJgGJn+qipv2HDH5u1wQsDnX/+g3+yf/l94wzauL5tItD2Zp
jEmEZcbVzQXjdZ+rPeHe6Xuo6siEXUV5wGHAj4VqIKhG4zo8BCI=
=t2ol
-----END PGP SIGNATURE-----

--=-TJU8gLNWZOD8scOkB5hi--



--===============6445717311575062890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6445717311575062890==--
