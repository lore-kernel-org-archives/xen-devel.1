From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 08:23:06 +0200
Message-ID: <20180411062306.GG7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3169258705358190429=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
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


--===============3169258705358190429==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 10, Dario Faggioli wrote:

> I remember specifically wanting for it to support not only "nodes:", but also
> "node:", because I thought that, e.g., "nodes:3" would have sound weird to
> users.

It turned out that I had a typo all the time in my template, it used
'cpu=' rather than 'cpus='. On this system none of this works:
#pus="node:${node}"
cpus="nodes:${node}"
#pus="nodes:${node},^node:0"
#pus_soft="nodes:${node},^node:0"

Only 'cpus=node:1' or 'cpus=nodes:1' works, cpus=node:2 or node:3 does
not. There is room for domUs:
numa_info              :
node:    memsize    memfree    distances
   0:     30720       1912      10,21,21,21
   1:     28672      22355      21,10,21,21
   2:     24576      24502      21,21,10,21
   3:     32768      31760      21,21,21,10

But, that is a separate issue. The BUG triggers without the cpus= knob.

Olaf

--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs2pxgAKCRBdQqD6ppg2
fkmQAJ9CUFHV0zRaWeM/xOQWk7WR0YAyzgCgi0z2TU6geqFJz8xK88Nw1nPqFHE=
=4uAr
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--


--===============3169258705358190429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3169258705358190429==--
