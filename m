From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 13:33:39 +0200
Message-ID: <39c1b4b67e2b72516eaa95c177ed14e667961917.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5914779591212066691=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5914779591212066691==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-k7Nmpc3XgAhe0+LE9f6I"


--=-k7Nmpc3XgAhe0+LE9f6I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-10 at 11:59 +0100, George Dunlap wrote:
> On 04/10/2018 11:33 AM, Dario Faggioli wrote:
> > On Tue, 2018-04-10 at 09:34 +0000, George Dunlap wrote:
> > > Assuming the bug is this one:
> > >=20
> > > BUG_ON( cpu !=3D snext->vcpu->processor );
> > >=20
> >=20
> > Yes, it is that one.
> >=20
> > Another stack trace, this time from a debug=3Dy built hypervisor, of
> > what
> > we are thinking it is the same bug (although reproduced in a
> > slightly
> > different way) is this:
> >=20
> > (XEN) ----[ Xen-4.7.2_02-36.1.12847.11.PTF  x86_64  debug=3Dy  Not
> > tainted ]----
> > (XEN) CPU:    45
> > (XEN) RIP:    e008:[<ffff82d08012508f>]
> > sched_credit.c#csched_schedule+0x361/0xaa9
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d08012508f>]
> > sched_credit.c#csched_schedule+0x361/0xaa9
> > (XEN)    [<ffff82d08012c233>] schedule.c#schedule+0x109/0x5d6
> > (XEN)    [<ffff82d08012fb5f>] softirq.c#__do_softirq+0x7f/0x8a
> > (XEN)    [<ffff82d08012fbb4>] do_softirq+0x13/0x15
> > (XEN)    [<ffff82d0801fd5c5>] vmx_asm_do_vmentry+0x25/0x2a
> >=20
> > (I can provide it all, if necessary.)
> >=20
> > I've done some analysis, although when we still were not entirely
> > sure
> > that changing the affinities was the actual cause (or, at least,
> > what
> > is triggering the whole thing).
> >=20
> > In the specific case of this stack trace, the current vcpu running
> > on
> > CPU 45 is d3v11. It is not in the runqueue, because it has been
> > removed, and not added back to it, and the reason is it is not
> > runnable
> > (it has VPF_migrating on in pause_flags).
> >=20
> > The runqueue of pcpu 45 looks fine (i.e., it is not corrupt or
> > anything
> > like that), it has d3v10,d9v1,d32767v45 in it (in this order)
> >=20
> > d3v11->processor is 45, so that is also fine.
> >=20
> > Basically, d3v11 wants to move away from pcpu 45, and this might
> > (but
> > that's not certain) be the reson because we're rescheduling. The
> > fact
> > that there are vcpus wanting to migrate can very well be the cause
> > of
> > affinity being changed.
> >=20
> > Now, the problem is that, looking into the runqueue, I found out
> > that
> > d3v10->processor=3D32. I.e., d3v10 is queued in pcpu 45's runqueue,
> > with
> > processor=3D32, which really shouldn't happen.
> >=20
> > This leads to the bug triggering, as, in csched_schedule(), we read
> > the
> > head of the runqueue with:
> >=20
> > snext =3D __runq_elem(runq->next);
> >=20
> > and then we pass snext to csched_load_balance(), where the BUG_ON
> > is.
> >=20
> > Another thing that I've found out, is that all "misplaced" vcpus
> > (i.e.,
> > in this and also in other manifestations of this bug) have their
> > csched_vcpu.flags=3D4, which is CSCHED_FLAGS_VCPU_MIGRATING.
> >=20
> > This, basically, is again a sign of vcpu_migrate() having been
> > called,
> > on d3v10 as well, which in turn has called csched_vcpu_pick().
> >=20
> > > a nasty race condition=E2=80=A6 a vcpu has just been taken off the
> > > runqueue
> > > of the current pcpu, but it=E2=80=99s apparently been assigned to a
> > > different
> > > cpu.
> > >=20
> >=20
> > Nasty indeed. I've been looking into this on and off, but so far I
> > haven't found the root cause.
> >=20
> > Now that we know for sure that it is changing affinity that trigger
> > it,
> > the field of the investigation can be narrowed a little bit... But
> > I
> > still am finding hard to spot where the race happens.
> >=20
> > I'll look more into this later in the afternoon. I'll let know if
> > something comes to mind.
>=20
> Actually, it looks quite simple:  schedule.c:vcpu_move_locked() is
> supposed to actually do the moving; if vcpu_scheduler()->migrate is
> defined, it calls that; otherwise, it just sets v-
> >processor.  Credit1
> doesn't define migrate.  So when changing the vcpu affinity on
> credit1,
> v->processor is simply modified without it changing runqueues.
>=20
> The real question is why it's so hard to actually trigger any
> problems!
>=20
Wait, but when vcpu_move_locked() is called, the vcpu being moved
should not be in any runqueue.

In fact, it is called from vcpu_migrate() which, in its turn, is always
 preceded by a call to vcpu_sleep_nosync(), that removes the vcpu from
the runqueue.

The only exception is when it is called from context_saved(). But then
again, the vcpu on which it is called is not on the runqueue, because
it was found not runnable.

That is why things works... well, apart from this bug. :-)

I mean, the root cause of this bug may very well be that there is a
code path that leads to calling vcpu_move_locked() on a vcpu that is
still in a runqueue... but have you actually identified it?

> But as a quick fix, implementing csched_vcpu_migrate() is probably
> the
> best solution.  Do you want to pick that up, or should I?
>=20
And what should csched_vcpu_migrate() do, apart from changing
vc->processor?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-k7Nmpc3XgAhe0+LE9f6I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrMoRMACgkQFkJ4iaW4
c+62MBAAp5/JPLtohF3Zrnxdg9w/NG2RXycWSnBjcqESwaSBl3yxJlJF0Dl+x3wA
FgoHwiXKEsBGRrBQOOs8nyii+luUEFJH4w7fXd6EBOqFOJqYYpbx+HWlM5tfHZ6L
bXUBBZzPyvIjCBuJqBEjRpnoKwyAI6qHJZRy9B6mDTZo9VHo6dTpz1vytY+mHF3T
SB8uGoW5dXaPktL0O/9tRrteDDFiwUuGh+hkrkYH+UkfhDc8PGZiDPtHMqdqb8iQ
kmJb/RsqFgk2NpHSPI+iuMjStCLHQ6cHK12VF/Rm9Jlz/9Sr23m5a1uAPyQTWoYt
stEqSFjz5Ll54oVrdXwScfbOV+901EIZjKzWydy4EIyEMWI1nBdzOjMGaF98TQ02
TQWacG3fkTt+9DP2poKg4qggY8EX+/wXBDv0mee8O19w06W7WtdevJAiyT7XXU4H
MzoDBhTK8hoebyRUAh4BpQkORKS3SGmx2HUpeIlrCdo8VB9WcqUp8sqR7dcsiW1B
XOcFR0S7cRXflIrb8rj4Kg7/CVOZ3aQlm732ZREj9BsPMfpDHW6qTRZR6e0tZGjX
rsD4zIPsl+iL5b1wUhbpWquvmnsismmmC79aax+/fsdYD0cTjNRP+f1WfkKFdALs
yoWAIK7WYnNS/PT57gwT8KW6P929jzA+Dl06mEZ8llSPK2is3bY=
=VuA9
-----END PGP SIGNATURE-----

--=-k7Nmpc3XgAhe0+LE9f6I--



--===============5914779591212066691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5914779591212066691==--
