From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Sun, 3 Mar 2019 02:10:24 +0100
Message-ID: <20190303011024.GP19265@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
 <20190227150508.GE19265@mail-itl>
 <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
 <20190228122546.GN5348@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4245175918429951801=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r4X1=RG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h0FeC-00083r-CQ
 for xen-devel@lists.xenproject.org; Sun, 03 Mar 2019 01:10:32 +0000
In-Reply-To: <20190228122546.GN5348@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4245175918429951801==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eAnxKwVhzStH6fSc"
Content-Disposition: inline


--eAnxKwVhzStH6fSc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable

On Thu, Feb 28, 2019 at 01:25:50PM +0100, Marek Marczykowski wrote:
> On Thu, Feb 28, 2019 at 03:58:37AM -0700, Jan Beulich wrote:
> > Another thing: You're also bypassing the MSI{,-X}-already-enabled
> > checks that __pci_enable_msi{,x}() do, yet allowing to enable both
> > on a device would be a security issue.
>=20
> Ok.

Hmm, could you explain more? Is that only the case when interrupt
remapping is missing?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eAnxKwVhzStH6fSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx7KYEACgkQ24/THMrX
1yzGngf+KvgKaNtC0bzoV9zfSCGoQ7kYoYh/ZbPSEKbEgtF/q9Kl1lCzfOf9ResW
G1YYcOZTqAdrErgxefwFgwwQKV2THVSyulJ/2LQBdPt7e4Zp6BCyOqBHThOVqy36
ss3Hhl/0T6uo1PZV2C5hcB6P8HK6YAFbIZoyV12XKe/JhYzgitO44b1bTT3gAi1t
XSfGA2lr316mmXNWSJ937Xt5RbYmKnnxODxzDTFtv0wC9+CM+kVccP3odfhBnVjV
RP9fuMMlqMsrwYvBJH+/aUWddQVLduVael2zVAhaXRsf3+yas0/nqqsIiqQnEAn8
/IryHrvhlM6uOB+gH5CsXVvaqGJCHA==
=juw4
-----END PGP SIGNATURE-----

--eAnxKwVhzStH6fSc--


--===============4245175918429951801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4245175918429951801==--
