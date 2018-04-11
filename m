From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 10:42:09 +0200
Message-ID: <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
 <20180411062306.GG7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4401610218995100412=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411062306.GG7177@aepfle.de>
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


--===============4401610218995100412==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cm4y/excnf94oJWWjP6V"


--=-cm4y/excnf94oJWWjP6V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 08:23 +0200, Olaf Hering wrote:
> It turned out that I had a typo all the time in my template, it used
> 'cpu=3D' rather than 'cpus=3D'. On this system none of this works:
> #pus=3D"node:${node}"
> cpus=3D"nodes:${node}"
> #pus=3D"nodes:${node},^node:0"
> #pus_soft=3D"nodes:${node},^node:0"
>=20
> Only 'cpus=3Dnode:1' or 'cpus=3Dnodes:1' works, cpus=3Dnode:2 or node:3
> does
> not.
> There is room for domUs:
> numa_info              :
> node:    memsize    memfree    distances
>    0:     30720       1912      10,21,21,21
>    1:     28672      22355      21,10,21,21
>    2:     24576      24502      21,21,10,21
>    3:     32768      31760      21,21,21,10
>=20
So, now, when you say 'does not work', do you mean 'domain creation is
aborted with errors' or 'domain is created, but memory is not where it
should be'.

IAC, here, when using `xl vcpu-pin':

root@Zhaman:/home/dario# xl vcpu-pin 1 all node:0-1,^nodes:0,4-7,^5
root@Zhaman:/home/dario# xl vcpu-list 1
Name                                ID  VCPU   CPU State   Time(s) Affinity=
 (Hard / Soft)
leap15                               1     0   14   -b-      15.5  4,6-15 /=
 all
leap15                               1     1   11   -b-       4.7  4,6-15 /=
 all
leap15                               1     2   12   -b-       4.6  4,6-15 /=
 all
leap15                               1     3   14   -b-       4.3  4,6-15 /=
 all
leap15                               1     4   14   -b-       5.8  4,6-15 /=
 all
leap15                               1     5    8   -b-       4.5  4,6-15 /=
 all
leap15                               1     6   10   -b-       4.3  4,6-15 /=
 all
leap15                               1     7    9   -b-       3.7  4,6-15 /=
 all

If I shut the domain down, and re-create it with cpus=3D"..." and
cpus_soft=3D"...":

root@Zhaman:/home/dario# cat vms/hvm/leap15.cfg |grep -e "cpus[=3D|_]"
cpus=3D"node:0,^4-6,nodes:1,^12,^14"
cpus_soft=3D"nodes:0,^node:1"
root@Zhaman:/home/dario# xl vcpu-list 2
Name                                ID  VCPU   CPU State   Time(s) Affinity=
 (Hard / Soft)
leap15                               2     0   13   -b-      17.3  0-3,7-11=
,13,15 / 0-7
leap15                               2     1    7   -b-       7.4  0-3,7-11=
,13,15 / 0-7
leap15                               2     2    0   -b-       6.0  0-3,7-11=
,13,15 / 0-7
leap15                               2     3    2   -b-       7.9  0-3,7-11=
,13,15 / 0-7

And from `xl debug-key u':
(XEN) [ 3841.835310] Domain 2 (total: 1044554):
(XEN) [ 3841.844555]     Node 0: 1044554
(XEN) [ 3841.844559]     Node 1: 0

which is fine, because soft-affinity is used, if it is explicitly specified=
.

So, I'd say that all seems to work fine, even using nodes and then only
a single digit, or using node and then a range. And also doing all the
various set manipulations, like "nodes:0,^node:1".

I really am not sure what the issue could be, there at your side...

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-cm4y/excnf94oJWWjP6V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrNymEACgkQFkJ4iaW4
c+6QqRAA5FX5DYW/3yDbe6g2FAMo1lIO+Tfe4cRi9OUPxZlZbc/OmepWs3lsPKwg
oB8C/67sdHhDBwvrUs4hlVhR2ZyxD30ohVZvsiKQXdrelw3ZyRxqNSMabGEYZ7Sj
XYpSm4oiU616fFgevGDDMv29H5L+omB317d+om/zIr+xM6Jl2dd+VISQKKGnnK6H
kaZwWY0OrbOkGz3+KEvztD1jkWF8eaT6NDW2dyoiPc8kc/MtLqqV/e/XZlhV3X6B
2pxsdJ3p3j+KTz/PIcFEZE0k66dNyeP7aE7mAzDQGsXNQPAbRg1buMBKHMniBAv5
f1yEWDIWyVcgXl6YjgnA6AffGTO1wlMpZ6BiD7fN5PIQs3y4TPinmVyOcItoJSy7
QW2zSh1ATNSH4emYW+CwAMchYHzJeqMXGAldGDnCWjJAPtYGz5y0pZNUgYZrgMqK
cSjfUgoKYfXWtj1EUygx6sy02ed5VJPVqUhayfBqHJt5TvrsAE5UmaIzNeuqAx4E
M4U3CHYMEd9xnAzOG2szLUwBFtfcErpQ/0N/zM7kyx4zPLMHjH4a0/VnrwkZtGYr
i5FWqIsq/lHlYzmr7N1OaOf29q6hnbaiT1WYV/BoIIPc9FjRKcHJWySaPLyXr/L1
PMl9aBU9+YwIemrs8uVlTA3ZM+SaLlm2KQ7i8iJsqlnUWJ1mpjM=
=81/J
-----END PGP SIGNATURE-----

--=-cm4y/excnf94oJWWjP6V--



--===============4401610218995100412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4401610218995100412==--
