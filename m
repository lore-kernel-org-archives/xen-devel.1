From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC v1 42/74] sched/null: skip vCPUs on the
 waitqueue that are blocked
Date: Fri, 12 Jan 2018 12:16:47 +0100
Message-ID: <1515755807.30117.139.camel@suse.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-43-wei.liu2@citrix.com>
 <5A535803020000780019C0D5@prv-mh.provo.novell.com>
 <ff97179c-1303-5668-4623-c3b4eec006e4@citrix.com>
 <1515750843.30117.96.camel@suse.com>
 <20180112104549.7n45ufiv7my7wwv6@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4377287721997195662=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=to5s=eh=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eZxKv-0005vS-0u
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 11:17:25 +0000
In-Reply-To: <20180112104549.7n45ufiv7my7wwv6@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============4377287721997195662==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zr9ZmWL8p7jWcqZbBGp1"


--=-zr9ZmWL8p7jWcqZbBGp1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-01-12 at 10:45 +0000, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jan 12, 2018 at 10:54:03AM +0100, Dario Faggioli wrote:
>
> > Err... yes. BTW, either there are a couple of typos in the above
> > paragraph, or it's me that can't read it well. Anyway, just to be
> > clear, if we have 4 pCPUs, and 6 VMs, with 1 vCPU each, this might
> > be
> > the situation:
> >=20
> > CPU0 <-- d1v0
> > CPU1 <-- d2v0
> > CPU2 <-- d3v0
> > CPU3 <-- d4v0
> >=20
> > Waitqueue: d5v0,d6v0
> >=20
> > Then, if d2 leaves/dies/etc, leaving CPU1 idle, d5v0 is picked up
> > from
> > the waitqueue and assigned to CPU1.
>=20
> I think the above example is not representative of what happens
> inside
> of the shim,=20
>
Indeed it's not. I was just trying to clarify, via an example, George's
explanation of how null works in general.

> since there's only one domain that runs on the shim, so
> the picture is something like:
>=20
> CPU0 <-- d1v0
> CPU1 <-- d1v1
>=20
> waitqueue: d1v2 (down), d1v3 (down)
>=20
Right. So, how about we change this in such a way that d1v2 and d1v3,
since they're offline, won't end up in the waitqueue?

> Then if the guest brings up another vCPU, let's assume it's vCPU#3
> pCPU#3 will be bring up form the shim PoV, and the null scheduler
> will
> assign the first vCPU on the waitqueue:
>=20
> CPU0 <-- d1v0
> CPU1 <-- d1v1
> CPU3 <-- d1v2 (down)
> NULL <-- d1v3 (up)
>=20
> Hence d1v2 which is still down will get assigned to CPU#3, and d1v3
> which is up won't get assigned to any pCPU, and hence won't run.
>=20
Exactly. While, if d1v2 and d1v3 were not in the waitqueue, while
offline, at all, whould would (should) happen is:

- CPU3 comes online ("in" the shim)
- CPU3 stays idle, as there's nothing in the waitqueue
- d1v3 comes online and is added to the shim's null scheduler
- as CPU3 does not have any vCPU assigned, d1v3 is assigned to it

> > Mmm, wait. In case of a domain which specifies both maxvcpus and
> > curvcpus, how many vCPUs does the domain in which the shim run?
>=20
> Regardless of the values of maxvcpus and curvcpus PV guests are
> always
> started with only the BSP online, and then the guest itself brings up
> other vCPUs.
>=20
> In the shim case vCPU hotplug is tied to pCPU hotplug, so everytime
> the guest hotplugs or unplugs a vCPU the shim does exactly the same
> with it's CPUs.
>=20
Sure, what I was asking was much rather this: if the guest config file
has "maxvcpus=3D4;vcpus=3D1", at the end of domain creation, and before any
`xl vcpu-set' or anything that would bring online other guest vCPU,
what's the output of `vl vcpu-list'. :-)

Anyway, I think you've answered to this below.

> > I'm not sure how an offline vCPU can end up there... but maybe I
> > need
> > to look at the code better, with the shim use case in mind.
> >=20
> > Anyway, I'm fine with checks that prevent offline vCPUs to be
> > assigned
> > to either pCPUs (like, the CPUs of L0 Xen) or shim's vCPUs (so, the
> > CPUs of L1 Xen). I'm less fine with rescheduling everyone at every
> > wakeup.
>=20
> So using the scenario from before:
>=20
> CPU0 <-- d1v0
> CPU1 <-- d1v1
>=20
> waitqueue: d1v2 (down), d1v3 (down)
>=20
> Guest decided to hotplug vCPU#2, and hence the shim first hotplugs
> CPU#2, but at the point CPU2 is added to the pool of CPUs vCPU2 is
> still not up, hence we get the following:
>=20
> CPU0 <-- d1v0
> CPU1 <-- d1v1
> CPU2 <-- NULL
>=20
> waitqueue: d1v2 (down), d1v3 (down)
>=20
> Then d1v2 is brought up, but since the null scheduler doesn't react
> to
> wakeup the picture stays the same:
>=20
> CPU0 <-- d1v0
> CPU1 <-- d1v1
> CPU2 <-- NULL
>=20
> waitqueue: d1v2 (up), d1v3 (down)
>=20
> And d1v2 doesn't get scheduled.
>=20
> Hope this makes sense :)
>=20
Yeah, and I see that it works.

What I'm saying is that I'd prefer, instead than having the null
scheduler reacting to wakeups of vCPUs in the waitqueue, to avoid
having the offline vCPUs in the waitqueue all together.

At which point, when d1v2 hotplug happens, there has to be a
null_vcpu_insert() (or something equivalent), to which the null
scheduler should react already.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-zr9ZmWL8p7jWcqZbBGp1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpYmR8ACgkQFkJ4iaW4
c+5wEw/9GUyKnuoxD8XocundGF/q+kOa0RiGSerrNfEyULNxUbtXBeYFggApdxpp
j/hAMHcyvzUiZn3RnjySHOxymLC0x0BlB+9N40fE8IL9m+GmQ7ipXkw7XZ4KSWPT
o/7qTmoymA90MkkdvORnFc3bW/HLXZyTJ4KDRfKgdUFWNCzfpwBIGy4S0QUs+tbo
RV4SkLF8NM4s5IsZw+wKHo3KhxyOOblFSDVr/ClpR/akZ40GmsvYaMFq2AM/iYJY
slXEEtmEQJ8vYqIHqaklG+dXyfDhnEOKDdizcnwW77D9YrDEcdNzB2gDYnolOb65
KO5h2rHRV94Efydpkv/dUaFGFKVeq63toPUGBH0Uf1P7sDUzLqVGTO7sbFERofqn
kV3tixcFm429gXkm/fvdBUm+wl2OUX9KxuK8Ia/se503kC9rFendT1xBGQs2x+6j
DF07LxFZAG4PM7oXTpLCejTWfDY18d575tyGxIT0u1JNE4UcaIMw/+Bebl7MPeMp
tH9393D4PBxA3TCrZvj6V+eha8yK+Gw545rt3pIF2dT1sNTqYfKgPWVZxkMHgVOk
3daPRTF5h1Eg+70P7XyMB0ofpqbixhydGLcUrUKYAuyodgPtVlvXAohWOqSkLPxy
3iurPYrzB5T/QxF7kZUaw8Fpq7ju4UR6/uUE6bsCwBNJTYb2yOA=
=GfZh
-----END PGP SIGNATURE-----

--=-zr9ZmWL8p7jWcqZbBGp1--



--===============4377287721997195662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4377287721997195662==--
