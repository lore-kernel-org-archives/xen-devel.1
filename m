From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC v1 42/74] sched/null: skip vCPUs on the
 waitqueue that are blocked
Date: Fri, 12 Jan 2018 10:54:03 +0100
Message-ID: <1515750843.30117.96.camel@suse.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-43-wei.liu2@citrix.com>
 <5A535803020000780019C0D5@prv-mh.provo.novell.com>
 <ff97179c-1303-5668-4623-c3b4eec006e4@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6992884487212026527=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=to5s=eh=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eZw2V-00066J-DZ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 09:54:19 +0000
In-Reply-To: <ff97179c-1303-5668-4623-c3b4eec006e4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6992884487212026527==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TWlRJIY3yjq2/NylTvhJ"


--=-TWlRJIY3yjq2/NylTvhJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

First of all, my filters somehow failed to highlight this for me, so
sorry if I did not notice it earlier (and now, I need new filters
anyway, as the email I'm using is different :-D).

I'll have a look at the patch ASAP.

On Mon, 2018-01-08 at 11:12 +0000, George Dunlap wrote:
> On 01/08/2018 10:37 AM, Jan Beulich wrote:
>
> > I don't understand: Isn't the null scheduler not moving around
> > vCPU-s at all? At least that's what the comment at the top of the
> > file says, unless I'm mis-interpreting it. If so, how can "some CPU
> > (...) pick this vCPU"?
>=20
> There's no current way to prevent a user from adding more vcpus to a
> pool than there are pcpus (if nothing else, by creating a new VM in a
> given pool), or from taking pcpus from a pool in which #vcpus >=3D
> #pcpus.
>=20
Exactly. And something that checks for that is all but easy to
introduce (let's just avoid even mentioning enforcing!).

> The null scheduler deals with this by having a queue of "unassigned"
> vcpus that are waiting for a free pcpu.  When a pcpu becomes
> available,
> it will do the assignment.  When a pcpu that has a vcpu is assigned
> is
> removed from the pool, that vcpu is assigned to a different pcpu if
> one
> is available; if not, it is put on the list.
>=20
Err... yes. BTW, either there are a couple of typos in the above
paragraph, or it's me that can't read it well. Anyway, just to be
clear, if we have 4 pCPUs, and 6 VMs, with 1 vCPU each, this might be
the situation:

CPU0 <-- d1v0
CPU1 <-- d2v0
CPU2 <-- d3v0
CPU3 <-- d4v0

Waitqueue: d5v0,d6v0

Then, if d2 leaves/dies/etc, leaving CPU1 idle, d5v0 is picked up from
the waitqueue and assigned to CPU1.


> In the case of shim mode, this also seems to happen whenever curvcpus
> <
> maxvcpus: The L1 hypervisor (shim) only sees curvcpus cpus on which
> to
> schedule L2 vcpus, but the L2 guest has maxvcpus vcpus to schedule,
> of
> which (maxvcpus-curvcpus) are  marked 'down'. =20
>
Mmm, wait. In case of a domain which specifies both maxvcpus and
curvcpus, how many vCPUs does the domain in which the shim run?

> In this case, it also
> seems that the null scheduler sometimes schedules a "down" vcpu when
> there are "up" vcpus on the list; meaning that the "up" vcpus are
> never
> scheduled.
>=20
I'm not sure how an offline vCPU can end up there... but maybe I need
to look at the code better, with the shim use case in mind.

Anyway, I'm fine with checks that prevent offline vCPUs to be assigned
to either pCPUs (like, the CPUs of L0 Xen) or shim's vCPUs (so, the
CPUs of L1 Xen). I'm less fine with rescheduling everyone at every
wakeup.

Roger, Wei, if/when you want to talk a bit about this, to explain the
situation a bit better, so I'll be able to help, feel free to ping me
 (email or IRC). :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-TWlRJIY3yjq2/NylTvhJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpYhbsACgkQFkJ4iaW4
c+4x+A//cNHYwRrXc1S9nU4mimdF/cPdn3ctX3zhKDSj8PeIvopQ/Pe90rqDDxJF
PEqsVVgPFoFY4DCIsFiJznV8vCDbYWek/fuxMjRYpRoVQsKU9OxylIXiyeFbzTm3
ujGKn8nIgVx4tczlh+n5RKb63IjJ9U84nXBsivzSTtfwr3Imfgmh8IXLUdGDO8KU
Szz1gRhhFMXgl69xndExm5eFYdYuyZEjSgnmdXZrp1mmRTalMimRzZUBVmXmth1c
ApyrIieOD3FMjnThgiB/9nNCmFUHbZA6PhYY+dokFwE21SEb3K1NYwA3fb2Txl+2
PwGQ212fP+9qkW7WhjXbhP3nHANo+hvvc24/KZJJWSv5Y2ezcDaUI236xXNVSMEr
LS3al+urqHHQCAy4x3bR6JpNYZ+nfO+aIJHPLCSZ7PEWIOif+t24BKx1cq6c+glA
fu2WTPQ+JbjI2zTiy2da7yM1YWrfBvjv4azBjhOEfTEQaXwkcZRiEWU8jHCA1ukp
cGG32YBtRzonCJlsKMbD8KGtL9BlrtydCh4HcqFus8SzLFQKVRaDzKQP53skqF9i
lbR+MqK3s+4vr9UyFqv6li9V4nt3vzZPAyb3TzIsUxztNTkEFysDdeG/5YqIx2xD
ZBVZQPt5+yWET6OvtQbZFlmC1jyoSF24BCXyH5Ja5m5f6Xy7bYI=
=jLce
-----END PGP SIGNATURE-----

--=-TWlRJIY3yjq2/NylTvhJ--



--===============6992884487212026527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6992884487212026527==--
