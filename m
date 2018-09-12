From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: BUG: sched=credit2 crashes system when using
 cpupools
Date: Thu, 13 Sep 2018 01:27:51 +1000
Message-ID: <3025735.xZ65HzDoXl@wopr.lan.crc.id.au>
References: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
 <faf61a4a900b3404de8077357e898159@crc.id.au>
 <9d3beeffa3ed724f751dc190b3de4d34a22f1ea3.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2554103356382315548=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=njql=l2=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1g073k-0002lj-Kh
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 15:28:04 +0000
In-Reply-To: <9d3beeffa3ed724f751dc190b3de4d34a22f1ea3.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============2554103356382315548==
Content-Type: multipart/signed; boundary="nextPart26053431.ib9BRS4ilb"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart26053431.ib9BRS4ilb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, 13 September 2018 1:11:20 AM AEST Dario Faggioli wrote:
> On Thu, 2018-08-30 at 18:49 +1000, Steven Haigh wrote:
> > On 2018-08-30 18:33, Jan Beulich wrote:
> > > Anyway - as J=C3=BCrgen says, something for the scheduler
> > > maintainers to look into.
>=20
> Ok, I'm back.
>=20
> > Yep - I just want to confirm that we tested this in BOTH NUMA
> > configurations - and credit2 crashed on both.
> >=20
> > I switched back to sched=3Dcredit, and it seems to work as expected:
> > # xl cpupool-list
> > Name               CPUs   Sched     Active   Domain count
> > Pool-node0          12    credit       y          3
> > Pool-node1          12    credit       y          0

Hi Dario,

I'll try to clarify below.
=20
> Wait, in a previous message, you said: "A machine where we could get
> this working every time shows". Doesn't that mean creating a separate
> pool for node 1 works with both Credit and Credit2, if the node has
> memory?
>=20
> I mean, trying to clarifying, my understanding is that you have to
> systems:
>=20
> system A: node 1 has *no* memory
> system B: both node 0 and node 1 have memory
>=20
> Creating a Credit pool with pcpus from node 1 always work on both
> systems.

Correct. With the credit scheduler, the pool split worked correctly on both=
=20
systems.
=20
> OTOH, when you try to create a Credit2 pool with pcpus from node 1,
> does it always crash on both systems, or does it work on system B and
> crashes on system A ?

Both systems crashed when using credit2. We originally thought this was due=
 to=20
the different memory layout between the two systems. This bit turned out to=
=20
not matter as both systems crashed in the same way.

> I do have a NUMA box with RAM in both nodes (so similar to system B).
> Last time I checked, what you're trying to do worked there, pretty much
> with any scheduler combination, but I'll recheck.
>=20
> I don't have a box similar to system A. I'll try to remove some of the
> RAM from that NUMA box, and check what happens.

In theory, if you reproduce what we did, it should crash anyway. The RAM=20
layout shouldn't matter.

We changed the scheduler in the grub line as 'sched=3Dcredit2'. Then did th=
e=20
split. I didn't try changing the Dom0 to boot with credit, but making the=20
pools credit2.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart26053431.ib9BRS4ilb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAluZMHcACgkQQa811Xp9
MdxSlA/+LMkOdqPbOUkvxP3KTmPuFa/j76oiOwK/GBlEDDjUhSEeoIPBw+wyJR0r
GeHCLw7/FR1MVZqCr5IEfgATaw+o1QMwNs7QU+f4ugvjlZeEMrcbx2zhwbakQOmh
GMHJAztbaRGspWW0/2ioV45ET83ONftDP2l423sLyl9g2EJZjrkFQE9uWvnXrntj
x2k6AiOapbqZ1i6eljrHA9Mxah1UsyKhpQoRiNiUfRNm+T541OtiXdtgoazpKj+c
3YRQwf7rJkrCu7WvXV6gR4ivVLZ2JajcdBL6jNQioM8H01oWYaDv8F1CBfhwYlml
yoqcn9AaaKImfpk1fMBWLS2n0bxJHw0/22BoNbhcwc+uKUTnXCoAm2KqrTq9f9+Q
ssE7m84sU6Irfd9uzcmWsqcNANoiBCEFuPb45b4o5ckYfJEc9xLgG4yKmgRLHwaW
mdcZQpdvk66Ptz+uHT/E5+bHTEho4igMblEFxpPhpMAnp42qS6CxnXXYaFXn9M+i
z1cOCuBdBSuxevUMhcikDIcpKEqpgowzkxx/pbs+cDW2/oM8578vKDULC4D8uHxg
YrsHGSkcM+WFjdmcLnTa2EVxqpCHB+O2RKVKlULEpWfVhrXvgWvyOU3fUv0/J5Z0
0ifovpuvmmyE9GD98NM5LqBENgsEhRnj+SMExwvz+Yokk0rHNRE=
=aCrx
-----END PGP SIGNATURE-----

--nextPart26053431.ib9BRS4ilb--





--===============2554103356382315548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2554103356382315548==--
