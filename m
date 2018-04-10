From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 21:03:02 +0200
Message-ID: <20180410190302.GC7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4279517000793581048=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============4279517000793581048==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 10, Dario Faggioli wrote:

> On Tue, 2018-04-10 at 17:59 +0200, Olaf Hering wrote:
> > memory=4444
> > vcpus=36
> > cpu="nodes:1,^node:0"
> > cpu_soft="nodes:1,^node:0"
> As said, its cpus= and cpus_soft=, and you probably just need
> cpus="node:1"
> cpus_soft="node:1"
> Or, even just:
> cpus="node:1"
> as, if soft-affinity is set to be equal to hard, it is just ignored.

Well, that was a noop. But xl.cfg states "nodes:0-3,^node:2", so this
should work:
cpus="nodes:3,^node:0"
cpus_soft="nodes:3,^node:0"

xl create -f fv_sles12sp1.f.tst.cfg
libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity: Domain 16:Setting vcpu affinity: Invalid argument
libxl: error: libxl_dom.c:461:libxl__build_pre: setting affinity failed on vcpu `0'
libxl: error: libxl_create.c:1265:domcreate_rebuild_done: Domain 16:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:1034:libxl__destroy_domid: Domain 16:Non-existant domain
libxl: error: libxl_domain.c:993:domain_destroy_callback: Domain 16:Unable to destroy guest
libxl: error: libxl_domain.c:920:domain_destroy_cb: Domain 16:Destruction of domain failed

Same for nodes:2..., just nodes:1... works.

And after some attempts, cpus="nodes:2/3" fails too.
There is no indication what is invalid.

Olaf

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs0KYwAKCRBdQqD6ppg2
fivcAKCgndLnTTKqK39oFftkmxncZbn0GgCfWFIIq1LTef5kb63ATZ8bCT2bwW0=
=S+79
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--


--===============4279517000793581048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4279517000793581048==--
