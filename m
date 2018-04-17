From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 17 Apr 2018 14:39:07 +0200
Message-ID: <d3ebfe2923568367c228419842378dc18afd578e.camel@suse.com>
References: <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
 <20180411062306.GG7177@aepfle.de>
 <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
 <20180411084829.GH7177@aepfle.de>
 <c94a6f9e273acae94c833e7465cb7f1e32ea19f6.camel@suse.com>
 <20180411124539.GJ7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5708318089333963616=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411124539.GJ7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5708318089333963616==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-XRbBWc3J9NFT1DyNnJzY"


--=-XRbBWc3J9NFT1DyNnJzY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 14:45 +0200, Olaf Hering wrote:
> On Wed, Apr 11, Dario Faggioli wrote:
>=20
> > If you're interested in figuring out, I'd like to see:
> > - full output of `xl info -n'
> > - output of `xl debug-key u'
> > - xl vcpu-list
> > - xl list -n
>=20
> Logs for this .cfg attached:
>=20
> name=3D'fv_sles12sp1.0'
> vif=3D[ 'mac=3D00:18:3e:58:00:c1,bridge=3Dbr0' ]
> memory=3D4444
> vcpus=3D36
> serial=3D"pty"
> builder=3D"hvm"
> kernel=3D"/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498
> /boot/vmlinuz"
> ramdisk=3D"/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug108849
> 8/boot/initrd"
> cmdline=3D"quiet panic=3D9
> root=3Dnfs:xen100:/share/migration/olh/bug1088498/nfsroot_sles12sp2.bug
> 1088498,vers=3D3,tcp,actimeo=3D1,nolock readonlyroot ro Xignore_loglevel
> Xdebug Xsystemd.log_target=3Dkmsg    Xsystemd.log_level=3Ddebug Xrd.debug
> Xrd.shell Xrd.udev.debug Xudev.log-priority=3Ddebug Xrd.udev.log-
> priority=3Ddebug console=3DttyS0"
> cpus=3D"node:2"
> #pus=3D"nodes:2"
> #pus=3D"nodes:2,^node:0"
> #pus_soft=3D"nodes:2,^node:0"
>
So, I do not really know what the problem could be here.

In fact, vcpu_hard_affinity is being defined, and numa_placement is
being set to false, which are both correct.

However, vcpu_hard_affinity seems to be empty:

"vcpu_hard_affinity": [
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            ...
            ...
            ...
        ],
        "numa_placement": "False",

Judging on the output of other xl commands, though, retrieving the cpus
from node 2 seems to work, and the fact that "node:2" behaves
differently than "node:1" is quite weird.

If we still have access to this system, it would be interesting to
instrument, e.g., update_cpumap_range() in xl_parse.c, and see what
actually libxl_node_to_cpumap() does in this case...

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-XRbBWc3J9NFT1DyNnJzY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrV6usACgkQFkJ4iaW4
c+4mgxAAuH2UgKPQvKStlUBrFG9IrfDdfJ2ekBpDauMPYgXA3A2qsrO48fhRTowO
dW9Up3LkT4CbM8ZQ4PFndmoyjep/vcjd8/jbEpfnzGp0K3x8Ohb5dgfIrwf6/6ma
yGDTnjY7kA6m8uertfnOPa6Kw00wFW2it043ZaD3bLactBeLEaRP7PcYU0yvtNeV
26af1qM5BNBPDboXOcF33SVY9kkIXYqt1AbQ4ZjF5Vg2SJmPw1Xx8zh9Zv6Ve68d
bDrgYRqFbuJPrQzQedvmb03kBUGLOysQ63vwK1Xzw92xkneS+DNH9lqw+ldjjAzI
8MrNexAGRTbxKhNqlRPfVf0jtGdUtqrUNrwqsWY/SrQ1JAZchRxU+BL9bQomPDe2
MH72au/4L4qe4pwqCNhTcQVLzYPM5boXffEF/22KM4J5IfwBWpm5JJ+brNe/t2M3
M73Tfo4yUTWIdmoBxngnpbE3/2sN1scozMzF0o6kqFIYR+6hZ4biBX2DxY53K9r6
etxQWT8tGTL+3BwMC8IQG1BnMEnPYZk+y+VSa4MC8dCA6cO2ZBxbm1ooUS6ASCjZ
Opc2nMFwmwYsodr6AWC6eror0S1OpQO2jd8OomnFzPytYe7jaYNL8sGxOU/TR7Bu
k4O/9R7JJu9BaGBiD978bUhAHVfNnfGd5jm4SoS9hwXjxJXPerI=
=Za4h
-----END PGP SIGNATURE-----

--=-XRbBWc3J9NFT1DyNnJzY--



--===============5708318089333963616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5708318089333963616==--
