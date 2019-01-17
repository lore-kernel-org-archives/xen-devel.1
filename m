From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/4] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use
Date: Thu, 17 Jan 2019 14:32:24 +0100
Message-ID: <20190117133224.GP1205@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <84045f5ed399411217c2ac8f3763add0c541a073.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116164719.aevcvhzotblpnbzw@mac>
 <20190116170033.GO1205@mail-itl>
 <20190117092134.5jkayufjoerleybm@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3689962005010437675=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Kg0=PZ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gk7mZ-00021X-Lw
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 13:32:31 +0000
In-Reply-To: <20190117092134.5jkayufjoerleybm@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3689962005010437675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Content-Disposition: inline


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v2 1/4] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use

On Thu, Jan 17, 2019 at 10:21:34AM +0100, Roger Pau Monn=C3=A9 wrote:
> OK. From an architectural PoV I think it would make more sense to copy
> the list of pci devices to the stubdom config in libxl__spawn_stub_dm,
> but I'm not that familiar with pci handling in libxl, so there might
> be a reason why things are done like this currently.

libxl would refuse to attach the same device to two domains and also
will perform some operations twice (as for example device reset). As you
can see even right now some things needs to be disabled for stubdomain
or target domain, because of this. If device would be included in the
config for both target domain and its stubdomain, the code would need
some more exceptions, which I think would be even worse.

Other thing is the current code attach PCI devices when device-model is
already running (regardless of its version or using stubdomain). I guess
qemu doesn't setup those devices otherwise (there is nothing on qemu
command line about it and none of libxl part generate such options). I'm
not really sure if that couldn't be done differently, but I'm kind of
afraid changing to much in PCI passthrough related code...

> The change LGTM, albeit I found the pci handling code quite hard to
> follow. I'm also not sure whether certain parts of the code are
> correct, for example the PCI INTx seems to be mapped to both the
> stubdomain and the target domain, when it's only the target domain the
> one that actually uses it.

That's true. Generally, I think stubdomain needs only config space
access for its own, other things should be done for the target domain.
This include mapping interrupts of any kind. Stubdomain is given
permission to them only to be able to map them to the target domain.

This also may be the reason why PCI devices are not included in
stubdomain's config, but only do_pci_add() is called. It may be that in
the past some more parts of the device setup was skipped this way.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxAg+gACgkQ24/THMrX
1ywJeAf+O41hPhvgq3Lb1yJsj3E01k41g9GXTKfT8wh3c6FPi8UwB3OF42faZZ2E
xoBrXbJ/qHmNhC1tQgrOb5eJ5f7ejLTu9BGcO8cwYOU7Tqx1HvCRJqf09ZW3w1tl
ws6yH2HvKoZYP88uMNsXmZYjXd7ersscGQW/scmzAYoXHFbTiwkWA3ZIM7WwezaT
PBo3K4eFeatKRrRA0iSlML9dpPjnW142JJe649Ws8H9TqQHS5JBQLVkEyyu8lmuK
bJSk6DfU4HqtcLOEd2YhEVMlEAhCtAThgTyWD4l4L5DzSxwX2uqCJBr2Wn6HilDS
ipTAQDEnLhUkfetve+UE9P1eOK6ZdQ==
=wJ42
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--


--===============3689962005010437675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3689962005010437675==--
