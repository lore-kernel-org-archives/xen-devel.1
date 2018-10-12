From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Fri, 12 Oct 2018 09:49:27 +0200
Message-ID: <8224a31a6fd968344499b52e4bc77d78576c1a8e.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
 <3636eba03691a0331a6e82cb11a651fd41c475ec.camel@suse.com>
 <6ffe5f58-8aec-c349-e08b-58dc1d3d5469@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0075944965124508260=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ulkm=my=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gAsCU-0007qE-Pt
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 07:49:34 +0000
In-Reply-To: <6ffe5f58-8aec-c349-e08b-58dc1d3d5469@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Bhavesh Davda <bhavesh.davda@oracle.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============0075944965124508260==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-COtWP2eRmW/oI+7BqkYn"


--=-COtWP2eRmW/oI+7BqkYn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-12 at 07:15 +0200, Juergen Gross wrote:
> On 11/10/2018 19:37, Dario Faggioli wrote:
> >=20
> > So, for example:
> > - domain A has vCore0 and vCore1
> > - each vCore has 2 threads ({vCore0.0, vCore0.1} and
> >   {vCore1.0, vCore1.1})
> > - we're on a 2-way SMT host
> > - vCore1 is running on physical core 3 on the host
> > - more specifically, vCore1.0 is currently executing on thread 0 of
> >   physical core 3 of the host, and vCore1.1 is currently executing
> > on
> >   thread 1 of core 3 of the host
> > - say that both vCore1.0 and vCore1.1 are in guest context
> >=20
> > Now:
> > * vCore1.0 blocks. What happens?
>=20
> It is going to vBlocked (the physical thread is sitting in the
> hypervisor waiting for either a (core-)scheduling event or for
> unblocking vCore1.0). vCore1.1 keeps running. Or, if vCore1.1
> is already vIdle/vBlocked, vCore1 is switching to blocked and the
> scheduler is looking for another vCore to schedule on the physical
> core.
>=20
Ok. And then we'll have one thread in guest context, and one thread in
Xen (albeit, idle, in this case). In these other cases...

> > * vCore1.0 makes an hypercall. What happens?
>=20
> Same as today. The hypercall is being executed.
>=20
> > * vCore1.0 VMEXITs. What happens?
>=20
> Same as today. The VMEXIT is handled.
>=20
... we have one thread in guest context, and one thread in Xen, and the
one in Xen is not just staying idle, it's doing hypercalls and VMEXIT
handling.

> In case you referring to a potential rendezvous for e.g. L1TF
> mitigation: this would be handled scheduler agnostic.
>=20
Yes, that was what I was thinking to. I.e., in order to be able to use
core-scheduling as a _fully_effective_ mitigation for stuff like L1TF,
we'd need something like that.

In fact, core-scheduling "per-se" mitigates leaks among guests, but if
we want to fully avoid for two threads to ever be in different security
contexts (like one in guest and one in Xen, to prevent Xen data leaking
to a guest), we do need some kind of synchronized Xen enters/exits,
AFAIUI.

What I'm trying to understand right now, is whether implementing things
in this way you're proposing, would help achieving that. And what I've
understood so far is that, no it doesn't.

The main difference between the two approaches would be that we
implement it once in schedule.c, for all schedulers. But this, I see it
as something having both up and down sides (yeah, like everything on
Earth, I know! :-P). More on this later.

> > All in all, I like the idea, because it is about introducing nice
> > abstractions, it is general, etc., but it looks like a major rework
> > of
> > the scheduler.
>=20
> Correct. Finally something to do :-p
>=20
Indeed! :-)

> > Note that, while this series which tries to implement core-
> > scheduling
> > for Credit1 is rather long and messy, doing the same (and with a
> > similar approach) for Credit2 is a lot easier and nicer. I have it
> > almost ready, and will send it soon.
>=20
> Okay, but would it keep vThreads of the same vCore let always running
> together on the same physical core?
>=20
It doesn't right now, as we don't have a way to expose such information
to the guest, yet. And since without such a mechanism, the guest can't
take advantage of something like this (neither from a performance nor
from a vuln. mitigation point of view), I kept that out.

But I certainly can see about making it do so (I was already planning
to).

> > Right. But again, in Credit2, I've been able to implement socket-
> > wise
> > coscheduling with this approach (I mean, an approach similar to the
> > one
> > in this series, but adapted to Credit2).
>=20
> And then there still is sched_rt.c
>=20
Ok, so I think this is the main benefit of this approach. We do the
thing once, and all schedulers get core-scheduling (or whatever
granularity of group scheduling we implement/allow).

But how easy it is to opt out, if one doesn't want it? E.g., in the
context of L1TF, what if I'm not affected, and hence am not interested
in core-scheduling? What if I want a cpupool with core-scheduling and
one without?

I may be wrong, but out of the top of my head, but it seems to me that
doing things in schedule.c makes this a lot harder, if possible at all.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-COtWP2eRmW/oI+7BqkYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvAUgcACgkQFkJ4iaW4
c+70qQ/+K8ugQRxmPYM6C6UEwciah43t7ghR5hGyfCGbfbs6uDXTYAA9CpzhJ1T4
+u7TbLvy3kMhDRiuHpQwg3jvyv0Mnab2zGeZLChWkPOETAWUaUGjBsTU+SX53V6j
9tOX8qn8khvyuZ4lba+Rq/vmPNR63LixtkYZx3/ShDoGNFiWYviHmN+JkPbiAfij
b8MVLp1nUT5ZbH35+0+Upmt6rMU6vXtaSzgSr2aqkf86BKiZ0k0BQu9g94YxRtWV
bpOL/9h3HXoAio3xQ8LXaZTWv6r3NRIj/mC6cp/vAKcZ9LIsNkOUXNHsMpvjvg3z
aWdna1vkXFcCUWlMP11BI1V724M/0q+7iDfWEmTKiY4ZAabbbFUJtcACVj/FRSSb
7GiCoHvmIasKOzackVpMqOYVecIltOaIqGt4qBMeywVUOaKgn1BgNGgyYDvgj6pX
yE+BrH0xJFMFenmy8MTPOCF3VNEqpTCrgYImSpn6sZwXkp7vJtS6eCoQnjoOtU14
hjn1AAI3Sy5H3GwS0XSJrbOrBZWd1Cs/bzGZ3qA2iHi/jnCTs99ms6ldhs8oa9eO
LgpRBvjrt2+dqXHJvf7RohFw7jdVE9txzOxSp/m5xryh4uRvtGp/U3Po4LFbyMfx
I0S3z4zZ3ORgolBZcdTp5tcr+VZWqQZ+pSTY6fAxFraWhgGDIg8=
=1ml4
-----END PGP SIGNATURE-----

--=-COtWP2eRmW/oI+7BqkYn--



--===============0075944965124508260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0075944965124508260==--
