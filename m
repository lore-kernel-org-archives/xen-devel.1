From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 07/17] libxl: add save/restore support
 for qemu-xen in stubdomain
Date: Wed, 1 Aug 2018 23:47:16 +0200
Message-ID: <20180801214716.GZ1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <f231deae2650e7ea6125bd22ed8263a7af4d9331.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuOePmgguxjHU1VmTcn3qMQw1gFVXoaj_3kzmeFjn5gbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5841061468007049554=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkyxl-0001De-9e
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 21:47:21 +0000
In-Reply-To: <CAKf6xpuOePmgguxjHU1VmTcn3qMQw1gFVXoaj_3kzmeFjn5gbA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============5841061468007049554==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ie3mu0AkGGOh6179"
Content-Disposition: inline


--Ie3mu0AkGGOh6179
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:35:26AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > Rely on a wrapper script in stubdomain to attach FD 3/4 of qemu to
> > relevant consoles.
>=20
> Should FD 3 & 4 be defined in some header?  That's not useful from a
> wrapper shell script, but it should be documented somewhere.

Maybe. See cover letter.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>=20
> Regards,
> Jason

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Ie3mu0AkGGOh6179
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltiKmQACgkQ24/THMrX
1yx9ggf9Hj10jpFeRcaYZB6LmPf/Yx6za3EoFf7n6ttteeQ5kiXZm+un4FT4zEFL
IWOE79cZv6vlF6Nl+EIyB70K4cOpnQWsKdWfHAuApfHsTEFMVK8DldoZADewznqG
gS4HHibixunmcFa0TlOGuO93/oq/TM1B3kHof+F+yqAiHMeaa+hybixnK/heu14A
ZQx9vn5SvhV2oKjrlDQxnenaFnS6Tu4HXxWIzu6QVZGpiOPEqKEJsp8ldT3zQJxx
GtgCMTOCHuuHCpaM4ASdyq7Ej5nK6CctwGruQk9I7+w5QesSlcpdYY34XNSTHAEl
z0f93xALOSUbVxdXwFA91AfBVao2sg==
=6c7M
-----END PGP SIGNATURE-----

--Ie3mu0AkGGOh6179--


--===============5841061468007049554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5841061468007049554==--
