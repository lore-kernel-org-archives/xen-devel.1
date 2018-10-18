From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Thu, 18 Oct 2018 15:48:20 +0200
Message-ID: <d531e7e6932c04caae2db94cb01d2aa5c87c59dd.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <CABfawh=OO14x9=_Cu=7Pk6v1+esuQav6Y-V9uOxonsmRBBovbw@mail.gmail.com>
 <f4d1194798bf33106ec76ac6ef85b0d648f839c7.camel@suse.com>
 <CABfawhkQ8+AnmH=_sXhSq0ktV1p_Akn+WHqKGidJzwBUY0z3yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7197965548496059336=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzov=m6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gD8f5-00072H-UH
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 13:48:27 +0000
In-Reply-To: <CABfawhkQ8+AnmH=_sXhSq0ktV1p_Akn+WHqKGidJzwBUY0z3yg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, bhavesh.davda@oracle.com, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7197965548496059336==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-yhxHaySGbzL8H/i+mNG8"


--=-yhxHaySGbzL8H/i+mNG8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-18 at 06:55 -0600, Tamas K Lengyel wrote:
> On Thu, Oct 18, 2018 at 2:16 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > On Wed, 2018-10-17 at 15:36 -0600, Tamas K Lengyel wrote:
> > > On Fri, Aug 24, 2018 at 5:36 PM Dario Faggioli <
> > > dfaggioli@suse.com>
> > > wrote:
> > > >=20
> > > > They give me a system that boots, where I can do basic stuff
> > > > (like
> > > > playing with dom0, creating guests, etc), and where the
> > > > constraint
> > > > of
> > > > only scheduling vcpus from one domain at a time on pcpus that
> > > > are
> > > > part
> > > > of the same core is, as far as I've seen, respected.
> > > >=20
> > > > There are still cases where the behavior is unideal, e.g., we
> > > > could
> > > > make a better use of some of the cores which are, some of the
> > > > times,
> > > > left idle.
> > > >=20
> > > > There are git branches here:
> > > >  https://gitlab.com/dfaggioli/xen.git rel/sched/core-
> > > > scheduling-
> > > > RFCv1
> > > >  https://github.com/fdario/xen.git rel/sched/core-scheduling-
> > > > RFCv1
> > > >=20
> > > > Any comment is more than welcome.
> > >=20
> > > Hi Dario,
> > >=20
> >=20
> > Hi,
> >=20
> > > thanks for the series, we are in the process of evaluating it in
> > > terms
> > > of performance. Our test is to setup 2 VMs each being assigned
> > > enough
> > > vCPUs to completely saturate all hyperthreads and then we fire up
> > > CPU
> > > benchmarking inside the VMs to spin each vCPU 100% (using swet).
> > > The
> > > idea is to force the scheduler to move vCPUs in-and-out
> > > constantly to
> > > see how much performance hit there would be with core-scheduling
> > > vs
> > > plain credit1 vs disabling hyperthreading. After running the test
> > > on
> > > a
> > > handful of machines it looks like we get the best performance
> > > with
> > > hyperthreading completely disabled, which is a bit unexpected.
> > > Have
> > > you or anyone else encountered this?
> > >=20
> >=20
> > Do you mean that no-hyperthreading is better than core-scheduling,
> > as
> > per this series goes?
> >=20
> > Or do you mean that no-hyperthreading is better than plain Credit1,
> > with SMT enabled and *without* this series?
> >=20
> > If the former, well, this series is not at a stage where it makes
> > sense
> > to run performance benchmarks. Not even close, I would say.
>=20
> Understood, just wanted to get a rough idea of how much it effects it
> in the worst case. We haven't got to actually run the tests on
> core-scheduling yet. On my laptop Xen crashed when I tried to create
> a
> VM after booting with sched_smt_cosched=3D1.=20
>
Ah, interesting! :-)

> On my desktop which has
> serial access creating VMs works but when I fired up swet in both VMs
> the whole system froze - no crash or anything reported on the serial.
> I suspect a deadlock because everything froze
> display/keyboard/serial/ping. But no crash and reboot.
>
Right. This is not something I've seen during my test. But, as said,
the code as it stands in this series, does have fairness issues, which
may escalate into starvation issues.

And if the load you're creating in the VMs is enough to let the VM
starve dom0 out of the host CPUs long enough, then you may get
something like what you're seeing.

> > If the latter, it's a bit weird, as I've often seen hyperthreading
> > causing seemingly weird performance figures, but it does not happen
> > very often that it actually slows down things (although, I wouldn't
> > rule it out! :-P).
>=20
> Well, we ran it on at least 4 machines thus far (laptops, NUC,
> desktops) and it is consistently better, and quite significantly. I
> can post our detailed results if interested.
>=20
Ok.

> > You can do all the above with Credit, and results should already
> > tell
> > us whether we may be dealing with some scheduling anomaly. If you
> > want,
> > since you don't seem to have oversubscription, you can also try the
> > null scheduler, to have even more data points (in fact, one of the
> > purposes of having it was exactly this, i.e., making it possible to
> > have a reference for other schedulers to compare against).
>=20
> We do oversubscribe. Say we have 4 pCPUs, 8 cores showing with
> hyperthread enabled. We run 2 VMs each with 8 vCPUs (16 total) and in
> each VM we create 8 swet processes each spinning at 100% at the same
> time. The idea is to create a scenario that's the "worst case", so
> that we can pinpoint the effect of the scheduler changes.=20
>
So, basically, you have 16 CPU hog vCPUs, on 8 pCPUs. How do you
measure the actual performance? Does swet print out something like the
cycles its doing, or stuff like that (sorry, I'm not familiar with it)?

IAC, in order to understand things better, I would run the experiment
gradually increasing the load.

Like (assuming 8 pCPUs, i.e., 4 cores with hyperthreading) you start
with one VM with 4 vCPUs, and then also check the 2 VMs with 2 vCPUs
each case. Without pinning. This would tell you what the performance
are, when only 1 thread of each core is busy.

You can also try pinning, just as a check. The numbers you get should
be similar to the non-pinned case.

Then you go up with, say, 1 VM with 6 and then 8 vCPUs (or 2 VMs with 3
and then 4 vCPUs), and check what the trend is. Finally, you go all the
way toward oversubscription.

Feel free to post the actual numbers, I'll be happy to have a look at
them.

What is this, BTW, staging?

> With pinning
> or fewer vCPUs then hyperthreads I believe it would be harder to spot
> the effect of the scheduler changes.
>=20
Absolutely, I was suggesting using pinning to try to understand why, in
this benchmark, it seems that hyperthreading has such a negative
effect, and whether or not this could be a scheduler bug or anomaly (I
mean in existing, checked-in code, not in the patch).

Basically, the pinning cases would act as a reference for (some of) the
unpinned ones. And if we see that there are significant differences,
then this may mean we have a bug.

To properly evaluate a change like core-scheduling, indeed we don't
want pinning... but we're not there yet. :-)

> > BTW, when you say "2 VMs with enough vCPUs to saturate all
> > hyperthreads", does that include dom0 vCPUs?
>=20
> No, dom0 vCPUs are on top of those but dom0 is largely idle for the
> duration of the test.
>
Ok, then don't use null, not even in the "undersubscribed" cases (for
now).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-yhxHaySGbzL8H/i+mNG8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvIjyQACgkQFkJ4iaW4
c+7u7RAAu8fIquMEby1uoFDH1JymwnYCGyjPUIUI4Cq72gUeEn3lFFvMgnOtRJmz
7sR4il8Ot74lzCSH6xJPDnYGohMIpGgShN/cEOjzVV6BrJ4iII6j/Bi7tYT6QJUE
5oafw7G89/ZE7xTbaNCAFIbUsh6z2S9Hbsxv6rR+GkfZHVY9Dl/jReSUWen/x8oM
4IZtTADca8h+v32dD05FLdnK3axuqV+TLNRrdWg6xuQaRxzVzE4b7SHL5NNBtYqe
IMhiI1q5+c0ztuqARJGaOjFKf2K249nBilJ+ZgGp8B+LGNzrCNHmNZmYDgR6zbg9
MfBxoxJZcMBnyRal1s5UxVWg5syi+P7Lx8ecQRbQewvQTbYFug8X7t8eHJpMhJNp
KDcqP1OBDbaQ5EMx9lkBb/43VHBrWqipb2pn/zUdip0bx7+c9Gxz9rSWgVZmhhNU
eeEehqVCA60SAGbd8U2CHUyppYmrk1QvWnWUa8JPFNQykvOrWYTc9KV1uAW51Ou1
B1LiaYNI5/hCk0ChQl9AgYHJv1R/NWCavApmDHFGT+o0WiLix7x3ZFl4mKpEnpSf
L13S1JPo++vDs9CjZUr5Ccf7hhp4bNFNzUt4ATyUpW5jr7m16yQm60J+q634m8hg
5/I9nUhm9A2RRZdsQ3QTdDHl54QPpFSei8AvjyC0bWh+1NaE36o=
=StIW
-----END PGP SIGNATURE-----

--=-yhxHaySGbzL8H/i+mNG8--



--===============7197965548496059336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7197965548496059336==--
