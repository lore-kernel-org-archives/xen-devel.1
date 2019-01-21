From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 0/4] QEMU changes to do PVH
 boot
Date: Mon, 21 Jan 2019 10:54:24 +0000
Message-ID: <20190121105424.GH30536@stefanha-x1.localdomain>
References: <154803791641.5550.15254007790773130906@2d3111e9616b>
 <7979bbc2-2713-4043-291b-79b7132634c0@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0468365322248336879=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cdle=P5=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1glXDp-00015L-Al
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 10:54:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id t27so22756504wra.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 02:54:27 -0800 (PST)
In-Reply-To: <7979bbc2-2713-4043-291b-79b7132634c0@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: fam@euphon.net, ehabkost@redhat.com, maran.wilson@oracle.com, mst@redhat.com, qemu-devel@nongnu.org, george.kennedy@oracle.com, stefanha@redhat.com, xen-devel@lists.xenproject.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org


--===============0468365322248336879==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 08:19:03AM +0000, Liam Merwick wrote:
> On 21/01/2019 02:31, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/1547554687-12687-1-git-send-email=
-liam.merwick@oracle.com/
> ...>
> >    CC      dma-helpers.o
> >    CC      vl.o
> > /tmp/qemu-test/src/block/sheepdog.c: In function 'find_vdi_name':
> > /tmp/qemu-test/src/block/sheepdog.c:1239:5: error: 'strncpy' specified =
bound 256 equals destination size [-Werror=3Dstringop-truncation]
> >       strncpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
> >       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >=20
>=20
>=20
> Given the PVH patch series was posted 5 days ago and the following change
> was committed 3 days ago, I'm assuming this is not related to the PVH
> changes (which do not touch this file).
>=20
> commit 97b583f46c435aaa40942ca73739d79190776b7f
> Author: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Date:   Thu Jan 3 09:56:35 2019 +0100
>=20
>     block/sheepdog: Use QEMU_NONSTRING for non NUL-terminated arrays

Yes, don't worry, it's a false positive.

Stefan

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcRaTgAAoJEJykq7OBq3PIyqEIAKTn3nBUrMCGFIo7UyaD93oQ
SdGjt0xqouk7nGmnvV71C/vPUSLzR78EF3yvseHSkJv+hpBA2WN+p+jQAyIWz3BP
ajszz66vHPKzte3Tpo1PBFuwgFSkTCgub+q2pna23g2QPharBhm/61QHsmcQ0eVs
P+NuHBZXfFBe0iZ1ykXR4OwmJ5Wmw+HBlTGUXMkJy3NV5+VU7Tlh+6Ek6hgfm+36
MLxONoXfQzXSJPHhrxPE8uGPrgAv5yAKiiO2AX7G/1n2dncicN/XKU/3Dy5AJ4z1
3pm9X0McNX4d9dv+k6CWSKc6Zku3xv2peTG6fe06xX0KjAwoibVejih3s0YoPc4=
=755q
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--


--===============0468365322248336879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0468365322248336879==--
