From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 11:01:59 +0200
Message-ID: <ebaf013f30f0b8f4718cbb4aa432e06a2258d98d.camel@suse.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
 <20180413082334.2dc6bf86.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7826704440049299308=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180413082334.2dc6bf86.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7826704440049299308==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vEZLSYMBAVZYWbWUVmTo"


--=-vEZLSYMBAVZYWbWUVmTo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-13 at 08:23 +0200, Olaf Hering wrote:
> Am Thu, 12 Apr 2018 19:25:43 +0200
> schrieb Dario Faggioli <dfaggioli@suse.com>:
>=20
> > Olaf, new patch! :-)
>=20
>     BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));
>=20
Thanks!

> (XEN) CPU 36: d10v1 isr=3D0 runnbl=3D1 proc=3D36 pf=3D0 orq=3D0 csf=3D4
>
So, FTR:
- CPU is smp_processor_id()
- dXvY is prev, in context_saved()
- isr is prev->is_running
- runnbl is vcpu_runnable(prev)
- proc is prev->processor
- pf is pref->pause_flags
- orq is __vcpu_on_runq(CSCHED_VCPU(prev)) (coming from sched_credit.c)
- csf is CSCHED_VCPU(prev)->flags

csf =3D 4 is CSCHED_FLAG_VCPU_MIGRATING, which means someone is calling
vcpu_migrate() on prev, on some other processor (presumably via
vcpu_set_affinity()) and is around here:

static void vcpu_migrate(struct vcpu *v)
{
    ...
    if ( v->is_running ||
         !test_and_clear_bit(_VPF_migrating, &v->pause_flags) )
    {
        sched_spin_unlock_double(old_lock, new_lock, flags);=20
        return;=20
    }=20
=20
    vcpu_move_locked(v, new_cpu);=20
=20
    sched_spin_unlock_double(old_lock, new_lock, flags);=20

    [**]=20

    if ( old_cpu !=3D new_cpu )=20
        sched_move_irqs(v);=20
=20
    /* Wake on new CPU. */=20
    vcpu_wake(v);=20
}

I.e., SCHED_OP(pick_cpu) has been called already, but not vcpu_wake().

We must be past the sched_spin_unlock_double() because, on this
processor (i.e., CPU 31 in this crash), we are, while printing,
_inside_ a critical section on prev's scheduler lock.

> (XEN) CPU 33: d10v2 isr=3D0 runnbl=3D0 proc=3D33 pf=3D1 orq=3D0 csf=3D4
> (XEN) CPU 20: d10v2 isr=3D0 runnbl=3D1 proc=3D20 pf=3D0 orq=3D0 csf=3D4
> (XEN) CPU 32: d10v0 isr=3D0 runnbl=3D1 proc=3D32 pf=3D0 orq=3D0 csf=3D4
> (XEN) CPU 33: d10v0 isr=3D0 runnbl=3D1 proc=3D12 pf=3D0 orq=3D0 csf=3D4
> (XEN) CPU 36: d10v0 isr=3D0 runnbl=3D1 proc=3D36 pf=3D0 orq=3D0 csf=3D4
> (XEN) CPU 31: d10v0 isr=3D0 runnbl=3D1 proc=3D31 pf=3D0 orq=3D0 csf=3D4
> (XEN) Xen BUG at sched_credit.c:877
> (XEN) ----[ Xen-4.11.20180411T100655.82540b66ce-
> 180413055758  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    31
>
Right, so, in this case, the vcpu_migrate()->SCHED_OP(pick_cpu) did not
change prev->processor. That could very well have happened. This just
means that, if it weren't for the BUG_ON added in csched_vcpu_migrate()
by this patch, this iteration would not have crashed in
csched_load_balance().

However, in previous report, we have seen a situation where
prev->processor was 31 on CPU 16.

Fact is, VPF_migrating is 0 right now, for prev, which corroborates the
theory that we are at [*] point, in vcpu_migrate() on the other CPU. In
fact, it was 1, but !test_and_clear_bit() has been called to reset it.

However, in order for us, on this CPU, to actually execute
sched_move_locked(), like we do:

> (XEN) Xen call trace:
> (XEN)    [<ffff82d08022c84d>]
> sched_credit.c#csched_vcpu_migrate+0x52/0x54
> (XEN)    [<ffff82d080239419>] schedule.c#vcpu_move_locked+0x42/0xcc
>
It means that someone raise VPF_migrating again!

> (XEN)    [<ffff82d08023a8d8>] schedule.c#vcpu_migrate+0x210/0x23b
> (XEN)    [<ffff82d08023c7ad>] context_saved+0x236/0x479
> (XEN)    [<ffff82d08027a558>] context_switch+0xe9/0xf67
> (XEN)    [<ffff82d0802397a9>] schedule.c#schedule+0x306/0x6ab
> (XEN)    [<ffff82d08023d56a>] softirq.c#__do_softirq+0x71/0x9a
> (XEN)    [<ffff82d08023d5dd>] do_softirq+0x13/0x15
> (XEN)    [<ffff82d080328d8b>] vmx_asm_do_vmentry+0x2b/0x30
> (XEN) ****************************************
> (XEN) Panic on CPU 31:
> (XEN) Xen BUG at sched_credit.c:877
> (XEN) ****************************************
>
Now, VPF_migrating is raise in the following circumstances:

* in __runq_tickle(): I actually was about to pinpoint this as the=20
  problem, but then I realized that, when calling __runq_tickle(prev),
  in vcpu_wake() (called by vcpu_migrate()), we do not set the bit on
  prev itself, but on the currently running vcpu of prev->processor.
  And a vcpu that is in  per_cpu(schedule_data, <CPU>).curr, can't=20
  also be prev in (any) context_saved(), I think.

* in csched_vcpu_acct(): we set the flag on CSCHED_VCPU(current). I=20
   may be wrong, but I don't immediatly see why we use current here,=20
   instead than curr_on_cpu(cpu). Yet, I think that, similarly to=20
   above, current can't be prev. Still, I may send a "Just in case"^TM=20
   patch... :-P

* in vcpu_force_reschedule(): it's used in shim code (well... :-) and=20
  in VCPUOP_set_periodic_timer(). But it only sets the flag if
  prev->is_running is 1, which is not. Besides, don't most guests use=20
  singleshot timer only these days?

* in cpu_disable_scheduler(): no. Just no.

* in vcpu_set_affinity(): well, it looks to me that, either, a) we use
  the set of the bit in here to actually enter the if() in
  context_saved(), which is a precondition for the race, and then we
  are already past that or, b) things just work. Will think more...

* in vcpu_pin_override(): again, no.... I think?

So, thoughts? :-)

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-vEZLSYMBAVZYWbWUVmTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrQcgcACgkQFkJ4iaW4
c+6OQg/+Pu66B+Iwt/43kxRH+qqrJDwTyEeKJCY+HQyxr7h0hq6+uu/CfpQl/Re9
yFz3gedy4TT1gQdOshc0aJZ45rd9yV0iwWf/g321RlJXprUK4hI1FThwW6gVpc/S
IcSN2aLp8JOouVBfBOsmGPk2FkwpS575E/lQmXN4iNKlGXIFroNR/rpfPWDwPD9s
WiyQi9D9aVq2wYZxOePeMktCBBbLGNy3p+myowAV+OAbujT5imtWmAPuHIXb+c2P
+4gEJwwZV9QIABpdvpglM8L8m2Nsmx4dMENjW3ijXbSt5yN+hXki/dFb5dtdd06D
n05dU008aiexVahO9fO+eY2+5McJndYTVHH5FaFDqtgvw8wZ71LQh7GkRiWQym38
K3ZQrhqRs0eWPfe7TUs0oaOo05hICrvW8BZ0cwtfz8I+3wXByaMiGvXAQOJ9Qudg
PUee5ymXFmMo17P/HCaRcJxcB2+dfoNxZfBSLBHCS+xPDiXVz2Xxb1SvG9XrvVVo
L43664NxfV0Bdv4v9QIyGllXFCCoqgmlbuh6YXzeoQdq8vNfpSj/siDrmvAC3V/i
kJojv5ATfa1YUWfYqOZXNPUoXl1aAkTfdTX2eh4TbC6um+NRmSqfSidokbIKc6KW
P73FiBsPcIRBTyULn1CHV3k2jloRZg8ty1IyfsIDJpXOyBRFxFc=
=GkDx
-----END PGP SIGNATURE-----

--=-vEZLSYMBAVZYWbWUVmTo--



--===============7826704440049299308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7826704440049299308==--
