From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 13/17] xenconsoled: add support for
 up to 3 secondary consoles
Date: Thu, 1 Nov 2018 19:25:59 +0100
Message-ID: <20181101182559.GE1638@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <58fad8fc7a60c5f9a6e107dafb52df2ef3d15665.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.14438.209179.640957@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3324984405175724239=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7tsl=nm=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gIHfS-0007hU-8F
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 18:26:06 +0000
In-Reply-To: <23515.14438.209179.640957@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3324984405175724239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 05:31:18PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 13/17] xenconsoled=
: add support for up to 3 secondary consoles"):
> > Based on previous few commits, this adds basic support for multiple
> > consoles in xenconsoled. A static number of them - up to 3 (+ one
> > primary).
>=20
> I'm confused.  I thought we already had support for multiple PV
> consoles.  Is the problem that the backend is in qemu rather than
> xenconsoled ? =20

Yes.
One of main reasons for this whole thing is to get rid of qemu from dom0
at all. Regardless if it's handling only console, only disk or other
stuff. This is a lot of code and I don't consider asking it nicely
"please don't let rogue domain let attack any other qemu component" to
be enough.=20

> I'm not sure how this patch interacts with the
> qemu-provided extra PV consoles in docs/misc/console.txt.

I try here to be compatible with qemu-provided consoles. Some limitation
may come from "xenconsoled: add support for non-pty output" patch, as it
implements only subset of qemu supported outputs.

> I'm afraid (as you probably predicted) I don't think this patch is
> suitable for upstream in its current form.  I can see that
> restructuring xenconsoled to be more dynamic is some work but I may be
> able to help there.
>=20
> CCing Stefano, the author of docs/misc/console.txt, at his new
> address.
>=20
> Thanks,
> Ian.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvbRTcACgkQ24/THMrX
1yzG/Af9EaptXaOpF/xlFd1D6dH0SL7UpTKrNP7Qrn3SOWTLxm2poXHC4adfnvvE
xl7ARXIWxszEsXLQc3ut1tK7qTUI6kNuepy2DBWYsnzuCAqn5dbyuHAMQG6RtNj/
3/0Rgq+PJWYZZES/A0bEVqeKr6twRdyQOqAhkof9v3ZMYM+7XL4SuXmDtA+RObV/
LqyC1fdfa8xmAZeUe5kYLW3U9PKfPC2HHjESLjUmFMqP00FKk35xqSAqvk+iC0TZ
aeGB7iAhKr+s3/ROMHeVkCclGgqiN6UQKHjYdnbSh+HVblx6xZcmW85FSPWvf3un
WNLhJ8C10+NeM9eZMMbJzn5ovVzEBQ==
=lBFG
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--


--===============3324984405175724239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3324984405175724239==--
