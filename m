From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Tue, 25 Sep 2018 19:49:50 +0200
Message-ID: <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
 <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1606078317776379593=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n84c=mh=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g4rTl-0007Bg-Mb
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 17:50:33 +0000
In-Reply-To: <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>, stefano@stabellini.net, Jan Beulich <JBeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============1606078317776379593==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Ol4/n+dhBu3YrRyFkHz0"


--=-Ol4/n+dhBu3YrRyFkHz0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding a few people to the Cc-list. See below...]

On Tue, 2018-09-25 at 12:15 +0100, Julien Grall wrote:
> Hi Dario,
>=20
Hi,

> On 09/25/2018 10:02 AM, Dario Faggioli wrote:
> > On Mon, 2018-09-24 at 22:46 +0100, Julien Grall wrote:
> > >=20
> > > Per my understanding of call_rcu, the calls will be queued until
> > > the
> > > RCU
> > > reached a threshold. We don't have many place where call_rcu is
> > > called,
> > > so reaching the threeshold may just never happen. But nothing
> > > will
> > > tell
> > > that vCPU to go in Xen and say "I am done with RCU". Did I miss
> > > anything?
> > >=20
> > Yeah, and in fact we added the timer _but_, in this case, it does
> > not
> > look that the timer is firing. It looks much more like "some random
> > interrupt happens", as you're suggesting. OTOH, in the case where
> > there
> > are no printk()s, it might be that the timer does fire, but the
> > vcpu
> > has not gone through Xen, so the grace period is, as far as we
> > know,
> > not expired yet (which is also in accordance with Julien's
> > analysis, as
> > far as I understood it).
>=20
> The timer is only activated when sched_tick_suspend() is called.
> With=20
> vwfi=3Dnative, you will never reach the idle_loop() and therefore
> never=20
> setup a timer.
>=20
Right.

> Milan confirmed that guest can be destroyed with vwfi=3Dnative removed.
> So=20
> this is confirming my thinking. Trapping wfi will end up to switch
> to=20
> idle vCPU and trigger the grace period.
>=20
Indeed.

> I am not entirely sure you will be able to reproduce it on x86, but
> I=20
> don't think it is a Xen Arm specific.
>=20
Perhaps with something like idle=3Dpoll. But I'm not sure, as it's not
the same thing (that is for guests, while wfi=3Dnative is in Xen).

Well, IAC, I don't think we can call it an ARM issue either. It's an
issue of whatever combination of platform and configuration we support,
which we allow not to trap when the guest goes idle.

> When I looked at the code, I don't see any grace period in other
> context=20
> than idle_loop. Rather than adding another grace period, I would
> just=20
> force quiescence for every call_rcu.
>=20
> This should not be have a big performance impact as we don't use
> much=20
> call_rcu and it would allow domain to be fully destroyed in timely
> manner.
>=20
I see your point, but this looks a little on the heavy side to me.
I'm not speaking of direct and measurable perf impact, but I think this
would make us diverge quite a bit from the idea of RCUs...

My knowledge of RCU themselves would need refreshing, though. I managed
to getbecome reasonably familiar with how the implementation we
imported works back then, when working on the said issue, but I guess I
better go check the code again.

I'm Cc-ing the people that have reviewed the patches and helping with
the idle timer problem, in case anyone has bright ideas out of the top
of his head.

Perhaps we should "just" get away from using RCU for domain destruction
(but I'm just tossing the idea around, without much consideration about
whether it's the right solution, or about how hard/feasible it really
is).

Or maybe we can still use the timer, in some special way, if we have
wfi=3Dnative (or equivalent)...

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-Ol4/n+dhBu3YrRyFkHz0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluqdUMACgkQFkJ4iaW4
c+7KrQ//RDkmuFSFnS7oSrOXttmKfaF2IGIRuDvqLvVSCKnx2Y4e/O/mZeieLxHZ
JgeB9z5TzLu+TIAvfvk0xwD+WPUApYeKL9vHSHLQWe/0dY2y+4h3YYK/MV0DOah2
+FLAWoAuYD56rF0YY7R98mJZ6BU9abKqKngDgKRMcOL0NsGdfYDeErkHVhpWSMp2
3iCaJzzpxYJrlHvhmcQqetmjt0ZBdNL9LsTGEbm1Kj0TLRnOp7AkOjANr3pNEhLg
v6I/EG461V63kkuJgxFJHjU1/RcCwpMtI4fzPkCHOVwVTB0SVZKTl2odYZKgNA9h
+odSmS6lvIkRYEwjo/Q75NNDG6A1O6Pe1IZ6zbgolrsEVjfYlD81X2ja5NMkaNIp
MIVx2ceI3WKYp3/E9kTYU/2mrtW3cf/XB9NAobJUJrJc+ArlA2tIingcYvmF4oKD
DNwTvgWSWcFS4z/SnGXu8xHL6qI8bPCJsneZGIV2PEGY8iu2f6Kv4logAYIqi0Aw
XB/yGF3970kfepmoIDsl1HvYZVLD+VN57512ccHRY5Gjl+QIHQLRTT4FtzGoQsAo
pzfJI67LDsRG0sSeJlOZAB9txMuX8cAuDNOZ3t/AJgQV7ZqstaoYlSh5OopQNnp/
SrmpXEVWsc8fsmo7hiHba4jNkOfMs3FOA9lm9ROK7nESablr4vQ=
=UMgz
-----END PGP SIGNATURE-----

--=-Ol4/n+dhBu3YrRyFkHz0--



--===============1606078317776379593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1606078317776379593==--
