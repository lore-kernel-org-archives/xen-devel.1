From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 10:48:29 +0200
Message-ID: <20180411084829.GH7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
 <20180411062306.GG7177@aepfle.de>
 <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7301448397778396024=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7301448397778396024==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ik0NlRzMGhMnxrMX"
Content-Disposition: inline


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 11, Dario Faggioli wrote:

> So, now, when you say 'does not work', do you mean 'domain creation is
> aborted with errors' or 'domain is created, but memory is not where it
> should be'.

domU can not be created due to "libxl__set_vcpuaffinity: setting vcpu
affinity: Invalid argument". I guess something is special on this system.

Olaf

--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs3L2gAKCRBdQqD6ppg2
fuOoAKDOPAMRClPy4dF5HnXwU38KQ3hlkQCg76JPqPoYt/SyU5UicMHlL8gMv28=
=Siqi
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--


--===============7301448397778396024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7301448397778396024==--
