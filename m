From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Fri, 8 Feb 2019 11:15:59 +0100
Message-ID: <20190208101559.GA21228@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <f5bf6b245f91398e0235a7b603ebc08ef64135ab.1549498018.git-series.marmarek@invisiblethingslab.com>
 <20190207095719.7r6mikq5ahdbw34p@mac>
 <20190207132124.GW21228@mail-itl> <20190207145238.GX21228@mail-itl>
 <20190207145754.t2pr4mlqjb2ohpqi@mac>
 <20190207154138.GY21228@mail-itl>
 <20190207174016.gij6u5wqhrhckt3a@mac>
 <20190207175157.GZ21228@mail-itl>
 <20190208093537.wzzgkxf7hllrrd4r@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3453972692513130046=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wKrr=QP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gs3Ce-0004Gv-7S
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 10:16:12 +0000
In-Reply-To: <20190208093537.wzzgkxf7hllrrd4r@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3453972692513130046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O9T4zNOkGnr0n+A/"
Content-Disposition: inline


--O9T4zNOkGnr0n+A/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2019 at 10:35:37AM +0100, Roger Pau Monn=C3=A9 wrote:
> What about hot-unplug? The proper flow there would be to ask the
> stubdomain to detach the device, and only deassign it after the
> stubdomain has reported successful detach. I think that's already the
> case.

I think so.

The approach with handling stubdomain permission in {create,destroy}_irq
seems to work, the patch will follow.=20
There is one code path where I haven't managed to properly extract
possible stubdomain in use:
pci_remove_device()
 -> pci_cleanup_msi()
   -> msi_free_irqs()
     -> msi_free_irq()
       -> destroy_irq()
   =20
For now I've hardcoded hardware_domain there (in msi_free_irqs). Can it
happen when device is still assigned to some domU?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--O9T4zNOkGnr0n+A/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxdVt8ACgkQ24/THMrX
1yzcuwf/UZwCIait1vMY6DRlVLtd9jM3QZNcQtWUhO7HXscOQ0PGYJHF1OvkdEdX
Qzb3IW7dYZE8S01cWDAzzTrR3o96gXlLHR1X5qz4pgHr1HWxvMBsZG/kD0VCtwKu
jkLlSPqFCVJIVz6LaSzmsr9wA44MK8Db36JY91UAK7v8kFL9cbbFhXi3Mvjme/f2
C/SAxOXZr77y/ks8mehu3JFK2rs5Rnh1H8Yzm2iJWMSBHiGa7/YQNh8v4H+EiAWR
qU0PP0Xr3z3JRfZFotVFC8xO2Mh3YBBIbzXigGKWT0DQX80R8TYCTDY069hERBCq
xw/igZnk8wEeTBFilA0t450LhTAphg==
=2PUw
-----END PGP SIGNATURE-----

--O9T4zNOkGnr0n+A/--


--===============3453972692513130046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3453972692513130046==--
