From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Thu, 11 Oct 2018 19:37:03 +0200
Message-ID: <3636eba03691a0331a6e82cb11a651fd41c475ec.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1086591474172341077=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ap2w=mx=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gAetY-00036q-R9
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 17:37:08 +0000
In-Reply-To: <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
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


--===============1086591474172341077==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cWzYO6UuzggRLDfJAgaC"


--=-cWzYO6UuzggRLDfJAgaC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Sorry if replying took some time. :-P

On Fri, 2018-09-07 at 18:00 +0200, Juergen Gross wrote:
> On 25/08/18 01:35, Dario Faggioli wrote:
> >=20
> > There are git branches here:
> >  https://gitlab.com/dfaggioli/xen.git rel/sched/core-scheduling-
> > RFCv1
> >  https://github.com/fdario/xen.git rel/sched/core-scheduling-RFCv1
> >=20
> > Any comment is more than welcome.
>=20
> Have you thought about a more generic approach?
>=20
I had. And I have thought about it more since this email. :-)

> Instead of trying to schedule only vcpus of the same domain on a core
> I'd rather switch form vcpu scheduling to real core scheduling. The
> scheduler would see guest cores to be scheduled on physical cores. A
> guest core consists of "guest threads" being vcpus (vcpus are bound
> to their guest cores, so that part of the topology could even be used
> by the guest for performance tuning).=20
>
Right, so I think I got the big picture. And it was something that, as
I've said above, I've been thinking too, and we've also talked about
something similar with Andrew in Nanjing.

I'm still missing how something like this would work in details,
perhaps because I'm really used to reason within the boundaries of the
model we currently have.

So, for example:
- domain A has vCore0 and vCore1
- each vCore has 2 threads ({vCore0.0, vCore0.1} and
  {vCore1.0, vCore1.1})
- we're on a 2-way SMT host
- vCore1 is running on physical core 3 on the host
- more specifically, vCore1.0 is currently executing on thread 0 of
  physical core 3 of the host, and vCore1.1 is currently executing on
  thread 1 of core 3 of the host
- say that both vCore1.0 and vCore1.1 are in guest context

Now:
* vCore1.0 blocks. What happens?
* vCore1.0 makes an hypercall. What happens?
* vCore1.0 VMEXITs. What happens?

> The state machine determining the core state from its vcpus would be
> scheduler agnostic (schedule.c), same for switching guest cores on a
> physical core.
>=20
What do you mean with "same for switching guest cores on a physical
core"?

All in all, I like the idea, because it is about introducing nice
abstractions, it is general, etc., but it looks like a major rework of
the scheduler.

And it's not that I am not up for major reworks, but I'd like to
understand properly what that is buying us.

Note that, while this series which tries to implement core-scheduling
for Credit1 is rather long and messy, doing the same (and with a
similar approach) for Credit2 is a lot easier and nicer. I have it
almost ready, and will send it soon.

> This scheme could even be expanded for socket scheduling.
>=20
Right. But again, in Credit2, I've been able to implement socket-wise
coscheduling with this approach (I mean, an approach similar to the one
in this series, but adapted to Credit2).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-cWzYO6UuzggRLDfJAgaC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu/ij8ACgkQFkJ4iaW4
c+6pHhAAlV9gvPfdahZ+bWO7l4sTnoEyKxdFkkgQcInCAs25abCRIIGHJqtwU43K
MbjpHWPHfUjaercW4HTY+ZKf4o8N/WN1qmKh+I9i58c/cvd9bcYIrTL+C7UsjkxR
cESJoz25FuliQ3WsdrqoH/runhYC5KsICNXZ5FxkrUziA357YmCelHbzLK7qbYwd
0VUHtHapvrVvYfmrW5KzphwaXyujcxNKFS7DuzcVjm/P8SOkVtxTiscQRi/K5+0u
sjmZxSTJHjFxbhZUHfyGHw1ueh+fxQA0EFIWcWtRxcGyMHGP9g1vB3S+H2FLuuv8
SR9ulUqKJpoYsMI9SmmZBnK49f4XKm1/K+5JNhQ9rBoHcuFCQie0QIcCm0GbDSje
dHUXDuvjs9s7+ws/AnhyrhiOToQesrQ5iFlm463BCkpCG0AiZNhSCZquqq7ieAWk
C9kj1WmX2hMAIyySaTEe6pDfOMYkal5DdcTdpcWDXET0MTWWoo/skcKFHve7LBbJ
w8bu/O073yYLTyrivlIwsINP7nN2lwLrJnDdw+OFfn68CHGe4We15LzsJJ6VgNmL
caaZOVszBRFYMRQub/L+0QIvG4lrz8lqrZ8NZiauAnO+s7yrZ7rKMOAtxOmsA77r
T8LI00VokhjjiX929t41swIdmNbq5NTrsAy9S3E33dbzHvEQB4c=
=08TB
-----END PGP SIGNATURE-----

--=-cWzYO6UuzggRLDfJAgaC--



--===============1086591474172341077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1086591474172341077==--
