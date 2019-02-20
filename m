From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
Date: Thu, 21 Feb 2019 00:39:41 +0100
Message-ID: <20190220233941.GA5279__26396.6287182242$1550706192$gmane$org@mail-itl>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8928113825264654514=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IXGB=Q3=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gwbV2-0004RW-GP
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 23:42:00 +0000
In-Reply-To: <20190220201609.28290-1-joao.m.martins@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ankur Arora <ankur.a.arora@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org


--===============8928113825264654514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 08:15:30PM +0000, Joao Martins wrote:
>  2. PV Driver support (patches 17 - 39)
>=20
>  We start by redirecting hypercalls from the backend to routines
>  which emulate the behaviour that PV backends expect i.e. grant
>  table and interdomain events. Next, we add support for late
>  initialization of xenbus, followed by implementing
>  frontend/backend communication mechanisms (i.e. grant tables and
>  interdomain event channels). Finally, introduce xen-shim.ko,
>  which will setup a limited Xen environment. This uses the added
>  functionality of Xen specific shared memory (grant tables) and
>  notifications (event channels).

Does it mean backends could be run in another guest, similarly as on
real Xen? AFAIK virtio doesn't allow that as virtio backends need
arbitrary write access to guest memory. But grant tables provide enough
abstraction to do that safely.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxt5T0ACgkQ24/THMrX
1ywuXgf8CxriAQi41O9KOBv2YBHj6F7y0aXbFijExKEae2dRQAFiC/FF3Pmsny4Q
m6MSC9lVwdkZeg05S9T0ljll+XPGVb5a2rwn1aevI6i0zHOsI8/MoJrkfpL9iUmR
VncMocTrf3ysT/azWkFCbQFmVYutTZx7YFTyTaqpH6Y0aSR/IfN4Tmkwf3Vck4Eq
kDesmHKpXdS8VdVXfV3umReqMJnvMZlRQfisUtOzRWqrORwooCcB83703ewGvHz+
n5/WJrbkZ8XeKOuK0NfIC3u45pvAFdI/7oH7LedoK4qwo/EV6HyfKMkrAjSVAxme
1b0Yyf/5F0sbZeFPOHGTVHFV6iBgsQ==
=MtoW
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--


--===============8928113825264654514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8928113825264654514==--
