From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RESEND 1/4] xen: sched: introduce
	'adjust_affinity' hook.
Date: Thu, 15 Mar 2018 19:10:19 +0000
Message-ID: <CAAWQecuGwke6t4NoFKUJpf6PGUPexStU7XB9OeQvWEKJEGB6yA@mail.gmail.com>
References: <152113809162.10025.17478920051714635122.stgit@Palanthas.fritz.box>
 <152113893521.10025.13747386307686765655.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1006366394264964400=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pphg=gf=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ewYHB-0001vu-UJ
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 19:10:57 +0000
Received: by mail-oi0-f54.google.com with SMTP id p9so2804656oic.6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 12:10:31 -0700 (PDT)
In-Reply-To: <152113893521.10025.13747386307686765655.stgit@Palanthas.fritz.box>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, anshul makkar <anshulmakkar@gmail.com>
List-Id: xen-devel@lists.xenproject.org

--===============1006366394264964400==
Content-Type: multipart/alternative; boundary="001a113de8fcbc14bd0567783e0a"

--001a113de8fcbc14bd0567783e0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il Gio 15 Mar 2018, 19:35 Dario Faggioli <dfaggioli@suse.com> ha scritto:

> From: Dario Faggioli <raistlin@linux.it>
>
> For now, just as a way to give a scheduler an "heads up",
> about the fact that the affinity changed.
>
> This enables some optimizations, such as pre-computing
> and storing (e.g., in flags) facts like a vcpu being
> exclusively pinned to a pcpu, or having or not a
> soft affinity. I.e., conditions that, despite the fact
> that they rarely change, are right now checked very
> frequently, even in hot paths.
>
> Note that, as we expect many scheduler specific
> implementations of the adjust_affinity hook to do
> something with the per-scheduler vCPU private data,
> this commit moves the calls to sched_set_affinity()
> after that is allocated (in sched_init_vcpu()).
>
> Note also that this, in future, may turn out as a useful
> mean for, e.g., having the schedulers vet, ack or nack
> the changes themselves.
>
> Signed-off-by: Dario Faggioli <raistlin@linux.it>
>

And I did forget to change this in dfaggioli@suse.com... :-/

In case the series can go in, would it be possible to fix this upon commit?

A=C4=BAternatively, I'm  certainly up for re-resending as well, just let me=
 know
what's better.

Sorry for the mess and Regards,
Dario


---
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Anshul Makkar <anshulmakkar@gmail.com>
> ---
> Changes from last posting:
> - rebased on staging.
>
> Changes from v2:
> - fix sched_set_affinity() not to use always hard_affinity;
> - move calls to sched_set_affinity() below per-scheduler vCPU data
> allocation.
> ---
>  xen/arch/x86/dom0_build.c  |    7 ++--
>  xen/common/schedule.c      |   75
> ++++++++++++++++++++++++++++++++------------
>  xen/include/xen/sched-if.h |    3 ++
>  xen/include/xen/sched.h    |    3 ++
>  4 files changed, 63 insertions(+), 25 deletions(-)
>
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 555660b853..b744791c38 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -140,14 +140,13 @@ struct vcpu *__init dom0_setup_vcpu(struct domain *=
d,
>      {
>          if ( pv_shim )
>          {
> -            __cpumask_set_cpu(vcpu_id, v->cpu_hard_affinity);
> -            __cpumask_set_cpu(vcpu_id, v->cpu_soft_affinity);
> +            sched_set_affinity(v, cpumask_of(vcpu_id),
> cpumask_of(vcpu_id));
>          }
>          else
>          {
>              if ( !d->is_pinned && !dom0_affinity_relaxed )
> -                cpumask_copy(v->cpu_hard_affinity, &dom0_cpus);
> -            cpumask_copy(v->cpu_soft_affinity, &dom0_cpus);
> +                sched_set_affinity(v, &dom0_cpus, NULL);
> +            sched_set_affinity(v, NULL, &dom0_cpus);
>          }
>      }
>
> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index 64524f4da7..f43d943765 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -256,18 +256,11 @@ static void sched_spin_unlock_double(spinlock_t
> *lock1, spinlock_t *lock2,
>  int sched_init_vcpu(struct vcpu *v, unsigned int processor)
>  {
>      struct domain *d =3D v->domain;
> +    cpumask_t allcpus;
>
> -    /*
> -     * Initialize processor and affinity settings. The idler, and
> potentially
> -     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
> -     */
> -    v->processor =3D processor;
> -    if ( is_idle_domain(d) || d->is_pinned )
> -        cpumask_copy(v->cpu_hard_affinity, cpumask_of(processor));
> -    else
> -        cpumask_setall(v->cpu_hard_affinity);
> +    cpumask_setall(&allcpus);
>
> -    cpumask_setall(v->cpu_soft_affinity);
> +    v->processor =3D processor;
>
>      /* Initialise the per-vcpu timers. */
>      init_timer(&v->periodic_timer, vcpu_periodic_timer_fn,
> @@ -282,6 +275,15 @@ int sched_init_vcpu(struct vcpu *v, unsigned int
> processor)
>      if ( v->sched_priv =3D=3D NULL )
>          return 1;
>
> +    /*
> +     * Initialize affinity settings. The idler, and potentially
> +     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
> +     */
> +    if ( is_idle_domain(d) || d->is_pinned )
> +        sched_set_affinity(v, cpumask_of(processor), &allcpus);
> +    else
> +        sched_set_affinity(v, &allcpus, &allcpus);
> +
>      /* Idle VCPUs are scheduled immediately, so don't put them in
> runqueue. */
>      if ( is_idle_domain(d) )
>      {
> @@ -359,6 +361,7 @@ int sched_move_domain(struct domain *d, struct cpupoo=
l
> *c)
>      for_each_vcpu ( d, v )
>      {
>          spinlock_t *lock;
> +        cpumask_t allcpus;
>
>          vcpudata =3D v->sched_priv;
>
> @@ -366,10 +369,12 @@ int sched_move_domain(struct domain *d, struct
> cpupool *c)
>          migrate_timer(&v->singleshot_timer, new_p);
>          migrate_timer(&v->poll_timer, new_p);
>
> -        cpumask_setall(v->cpu_hard_affinity);
> -        cpumask_setall(v->cpu_soft_affinity);
> +        cpumask_setall(&allcpus);
>
>          lock =3D vcpu_schedule_lock_irq(v);
> +
> +        sched_set_affinity(v, &allcpus, &allcpus);
> +
>          v->processor =3D new_p;
>          /*
>           * With v->processor modified we must not
> @@ -694,7 +699,7 @@ void restore_vcpu_affinity(struct domain *d)
>
>          if ( v->affinity_broken )
>          {
> -            cpumask_copy(v->cpu_hard_affinity,
> v->cpu_hard_affinity_saved);
> +            sched_set_affinity(v, v->cpu_hard_affinity_saved, NULL);
>              v->affinity_broken =3D 0;
>
>          }
> @@ -758,6 +763,8 @@ int cpu_disable_scheduler(unsigned int cpu)
>              if ( cpumask_empty(&online_affinity) &&
>                   cpumask_test_cpu(cpu, v->cpu_hard_affinity) )
>              {
> +                cpumask_t allcpus;
> +
>                  if ( v->affinity_broken )
>                  {
>                      /* The vcpu is temporarily pinned, can't move it. */
> @@ -775,7 +782,8 @@ int cpu_disable_scheduler(unsigned int cpu)
>                  else
>                      printk(XENLOG_DEBUG "Breaking affinity for %pv\n", v=
);
>
> -                cpumask_setall(v->cpu_hard_affinity);
> +                cpumask_setall(&allcpus);
> +                sched_set_affinity(v, &allcpus, NULL);
>              }
>
>              if ( v->processor !=3D cpu )
> @@ -845,8 +853,26 @@ int cpu_disable_scheduler(unsigned int cpu)
>      return ret;
>  }
>
> +/*
> + * In general, this must be called with the scheduler lock held, because
> the
> + * adjust_affinity hook may want to modify the vCPU state. However, when
> the
> + * vCPU is being initialized (either for dom0 or domU) there is no risk =
of
> + * races, and it's fine to not take the look (we're talking about
> + * dom0_setup_vcpu() an sched_init_vcpu()).
> + */
> +void sched_set_affinity(
> +    struct vcpu *v, const cpumask_t *hard, const cpumask_t *soft)
> +{
> +    SCHED_OP(dom_scheduler(v->domain), adjust_affinity, v, hard, soft);
> +
> +    if ( hard )
> +        cpumask_copy(v->cpu_hard_affinity, hard);
> +    if ( soft )
> +        cpumask_copy(v->cpu_soft_affinity, soft);
> +}
> +
>  static int vcpu_set_affinity(
> -    struct vcpu *v, const cpumask_t *affinity, cpumask_t *which)
> +    struct vcpu *v, const cpumask_t *affinity, const cpumask_t *which)
>  {
>      spinlock_t *lock;
>      int ret =3D 0;
> @@ -857,12 +883,19 @@ static int vcpu_set_affinity(
>          ret =3D -EBUSY;
>      else
>      {
> -        cpumask_copy(which, affinity);
> -
>          /*
> -         * Always ask the scheduler to re-evaluate placement
> -         * when changing the affinity.
> +         * Tell the scheduler we changes something about affinity,
> +         * and ask to re-evaluate vcpu placement.
>           */
> +        if ( which =3D=3D v->cpu_hard_affinity )
> +        {
> +            sched_set_affinity(v, affinity, NULL);
> +        }
> +        else
> +        {
> +            ASSERT(which =3D=3D v->cpu_soft_affinity);
> +            sched_set_affinity(v, NULL, affinity);
> +        }
>          set_bit(_VPF_migrating, &v->pause_flags);
>      }
>
> @@ -1100,7 +1133,7 @@ int vcpu_pin_override(struct vcpu *v, int cpu)
>      {
>          if ( v->affinity_broken )
>          {
> -            cpumask_copy(v->cpu_hard_affinity,
> v->cpu_hard_affinity_saved);
> +            sched_set_affinity(v, v->cpu_hard_affinity_saved, NULL);
>              v->affinity_broken =3D 0;
>              set_bit(_VPF_migrating, &v->pause_flags);
>              ret =3D 0;
> @@ -1114,7 +1147,7 @@ int vcpu_pin_override(struct vcpu *v, int cpu)
>          {
>              cpumask_copy(v->cpu_hard_affinity_saved,
> v->cpu_hard_affinity);
>              v->affinity_broken =3D 1;
> -            cpumask_copy(v->cpu_hard_affinity, cpumask_of(cpu));
> +            sched_set_affinity(v, cpumask_of(cpu), NULL);
>              set_bit(_VPF_migrating, &v->pause_flags);
>              ret =3D 0;
>          }
> diff --git a/xen/include/xen/sched-if.h b/xen/include/xen/sched-if.h
> index c5dd43ed9c..926d063ccf 100644
> --- a/xen/include/xen/sched-if.h
> +++ b/xen/include/xen/sched-if.h
> @@ -173,6 +173,9 @@ struct scheduler {
>                                      unsigned int);
>      int          (*adjust)         (const struct scheduler *, struct
> domain *,
>                                      struct xen_domctl_scheduler_op *);
> +    void         (*adjust_affinity)(const struct scheduler *, struct vcp=
u
> *,
> +                                    const struct cpumask *,
> +                                    const struct cpumask *);
>      int          (*adjust_global)  (const struct scheduler *,
>                                      struct xen_sysctl_scheduler_op *);
>      void         (*dump_settings)  (const struct scheduler *);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 39f938644a..ade4d7b9aa 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -846,6 +846,9 @@ void scheduler_free(struct scheduler *sched);
>  int schedule_cpu_switch(unsigned int cpu, struct cpupool *c);
>  void vcpu_force_reschedule(struct vcpu *v);
>  int cpu_disable_scheduler(unsigned int cpu);
> +/* We need it in dom0_setup_vcpu */
> +void sched_set_affinity(struct vcpu *v, const cpumask_t *hard,
> +                        const cpumask_t *soft);
>  int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
>  int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity);
>  void restore_vcpu_affinity(struct domain *d);
>
>

--001a113de8fcbc14bd0567783e0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Il Gio 1=
5 Mar 2018, 19:35 Dario Faggioli &lt;<a href=3D"mailto:dfaggioli@suse.com">=
dfaggioli@suse.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">From: Dario Faggioli &lt;<a href=3D"mailto:raistlin@linux.it" target=3D=
"_blank" rel=3D"noreferrer">raistlin@linux.it</a>&gt;<br>
<br>
For now, just as a way to give a scheduler an &quot;heads up&quot;,<br>
about the fact that the affinity changed.<br>
<br>
This enables some optimizations, such as pre-computing<br>
and storing (e.g., in flags) facts like a vcpu being<br>
exclusively pinned to a pcpu, or having or not a<br>
soft affinity. I.e., conditions that, despite the fact<br>
that they rarely change, are right now checked very<br>
frequently, even in hot paths.<br>
<br>
Note that, as we expect many scheduler specific<br>
implementations of the adjust_affinity hook to do<br>
something with the per-scheduler vCPU private data,<br>
this commit moves the calls to sched_set_affinity()<br>
after that is allocated (in sched_init_vcpu()).<br>
<br>
Note also that this, in future, may turn out as a useful<br>
mean for, e.g., having the schedulers vet, ack or nack<br>
the changes themselves.<br>
<br>
Signed-off-by: Dario Faggioli &lt;<a href=3D"mailto:raistlin@linux.it" targ=
et=3D"_blank" rel=3D"noreferrer">raistlin@linux.it</a>&gt;<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">And I did forget =
to change this in dfaggioli@suse.com... :-/</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">In case the series can go in, would it be possible to f=
ix this upon commit?</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
=C4=BAternatively, I&#39;m=C2=A0 certainly up for re-resending as well, jus=
t let me know what&#39;s better.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sorry for the mess and Regards,</div><div dir=3D"auto">Dario</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
Cc: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com" target=3D=
"_blank" rel=3D"noreferrer">george.dunlap@citrix.com</a>&gt;<br>
Cc: Anshul Makkar &lt;<a href=3D"mailto:anshulmakkar@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">anshulmakkar@gmail.com</a>&gt;<br>
---<br>
Changes from last posting:<br>
- rebased on staging.<br>
<br>
Changes from v2:<br>
- fix sched_set_affinity() not to use always hard_affinity;<br>
- move calls to sched_set_affinity() below per-scheduler vCPU data allocati=
on.<br>
---<br>
=C2=A0xen/arch/x86/dom0_build.c=C2=A0 |=C2=A0 =C2=A0 7 ++--<br>
=C2=A0xen/common/schedule.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A075 ++++++++++=
++++++++++++++++++++++------------<br>
=C2=A0xen/include/xen/sched-if.h |=C2=A0 =C2=A0 3 ++<br>
=C2=A0xen/include/xen/sched.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 ++<br>
=C2=A04 files changed, 63 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c<br>
index 555660b853..b744791c38 100644<br>
--- a/xen/arch/x86/dom0_build.c<br>
+++ b/xen/arch/x86/dom0_build.c<br>
@@ -140,14 +140,13 @@ struct vcpu *__init dom0_setup_vcpu(struct domain *d,=
<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( pv_shim )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __cpumask_set_cpu(vcpu_id, v-&gt=
;cpu_hard_affinity);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __cpumask_set_cpu(vcpu_id, v-&gt=
;cpu_soft_affinity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, cpumask_of=
(vcpu_id), cpumask_of(vcpu_id));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !d-&gt;is_pinned &amp;=
&amp; !dom0_affinity_relaxed )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt=
;cpu_hard_affinity, &amp;dom0_cpus);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_soft_affi=
nity, &amp;dom0_cpus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity=
(v, &amp;dom0_cpus, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, NULL, &amp=
;dom0_cpus);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/xen/common/schedule.c b/xen/common/schedule.c<br>
index 64524f4da7..f43d943765 100644<br>
--- a/xen/common/schedule.c<br>
+++ b/xen/common/schedule.c<br>
@@ -256,18 +256,11 @@ static void sched_spin_unlock_double(spinlock_t *lock=
1, spinlock_t *lock2,<br>
=C2=A0int sched_init_vcpu(struct vcpu *v, unsigned int processor)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d =3D v-&gt;domain;<br>
+=C2=A0 =C2=A0 cpumask_t allcpus;<br>
<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Initialize processor and affinity settings. The idle=
r, and potentially<br>
-=C2=A0 =C2=A0 =C2=A0* domain-0 VCPUs, are pinned onto their respective phy=
sical CPUs.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 v-&gt;processor =3D processor;<br>
-=C2=A0 =C2=A0 if ( is_idle_domain(d) || d-&gt;is_pinned )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_hard_affinity, cpumask_=
of(processor));<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(v-&gt;cpu_hard_affinity);<br>
+=C2=A0 =C2=A0 cpumask_setall(&amp;allcpus);<br>
<br>
-=C2=A0 =C2=A0 cpumask_setall(v-&gt;cpu_soft_affinity);<br>
+=C2=A0 =C2=A0 v-&gt;processor =3D processor;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Initialise the per-vcpu timers. */<br>
=C2=A0 =C2=A0 =C2=A0init_timer(&amp;v-&gt;periodic_timer, vcpu_periodic_tim=
er_fn,<br>
@@ -282,6 +275,15 @@ int sched_init_vcpu(struct vcpu *v, unsigned int proce=
ssor)<br>
=C2=A0 =C2=A0 =C2=A0if ( v-&gt;sched_priv =3D=3D NULL )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Initialize affinity settings. The idler, and potenti=
ally<br>
+=C2=A0 =C2=A0 =C2=A0* domain-0 VCPUs, are pinned onto their respective phy=
sical CPUs.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if ( is_idle_domain(d) || d-&gt;is_pinned )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, cpumask_of(processor), &=
amp;allcpus);<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, &amp;allcpus, &amp;allcp=
us);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Idle VCPUs are scheduled immediately, so don&#39;t p=
ut them in runqueue. */<br>
=C2=A0 =C2=A0 =C2=A0if ( is_idle_domain(d) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
@@ -359,6 +361,7 @@ int sched_move_domain(struct domain *d, struct cpupool =
*c)<br>
=C2=A0 =C2=A0 =C2=A0for_each_vcpu ( d, v )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t *lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_t allcpus;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpudata =3D v-&gt;sched_priv;<br>
<br>
@@ -366,10 +369,12 @@ int sched_move_domain(struct domain *d, struct cpupoo=
l *c)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_timer(&amp;v-&gt;singleshot_timer=
, new_p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_timer(&amp;v-&gt;poll_timer, new_=
p);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(v-&gt;cpu_hard_affinity);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(v-&gt;cpu_soft_affinity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(&amp;allcpus);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lock =3D vcpu_schedule_lock_irq(v);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, &amp;allcpus, &amp;allcp=
us);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;processor =3D new_p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * With v-&gt;processor modified we must =
not<br>
@@ -694,7 +699,7 @@ void restore_vcpu_affinity(struct domain *d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( v-&gt;affinity_broken )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_hard_affi=
nity, v-&gt;cpu_hard_affinity_saved);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, v-&gt;cpu_=
hard_affinity_saved, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;affinity_broken =3D 0=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -758,6 +763,8 @@ int cpu_disable_scheduler(unsigned int cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( cpumask_empty(&amp;onl=
ine_affinity) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_test=
_cpu(cpu, v-&gt;cpu_hard_affinity) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_t allcpus;=
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( v-&gt;af=
finity_broken )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* The vcpu is temporarily pinned, can&#39;t move it. */<br>
@@ -775,7 +782,8 @@ int cpu_disable_scheduler(unsigned int cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0printk(XENLOG_DEBUG &quot;Breaking affinity for %pv\n&quot;, v);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(v-&=
gt;cpu_hard_affinity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_setall(&am=
p;allcpus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity=
(v, &amp;allcpus, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( v-&gt;processor !=3D c=
pu )<br>
@@ -845,8 +853,26 @@ int cpu_disable_scheduler(unsigned int cpu)<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * In general, this must be called with the scheduler lock held, because t=
he<br>
+ * adjust_affinity hook may want to modify the vCPU state. However, when t=
he<br>
+ * vCPU is being initialized (either for dom0 or domU) there is no risk of=
<br>
+ * races, and it&#39;s fine to not take the look (we&#39;re talking about<=
br>
+ * dom0_setup_vcpu() an sched_init_vcpu()).<br>
+ */<br>
+void sched_set_affinity(<br>
+=C2=A0 =C2=A0 struct vcpu *v, const cpumask_t *hard, const cpumask_t *soft=
)<br>
+{<br>
+=C2=A0 =C2=A0 SCHED_OP(dom_scheduler(v-&gt;domain), adjust_affinity, v, ha=
rd, soft);<br>
+<br>
+=C2=A0 =C2=A0 if ( hard )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_hard_affinity, hard);<b=
r>
+=C2=A0 =C2=A0 if ( soft )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_soft_affinity, soft);<b=
r>
+}<br>
+<br>
=C2=A0static int vcpu_set_affinity(<br>
-=C2=A0 =C2=A0 struct vcpu *v, const cpumask_t *affinity, cpumask_t *which)=
<br>
+=C2=A0 =C2=A0 struct vcpu *v, const cpumask_t *affinity, const cpumask_t *=
which)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0spinlock_t *lock;<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
@@ -857,12 +883,19 @@ static int vcpu_set_affinity(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EBUSY;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(which, affinity);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Always ask the scheduler to re-evaluat=
e placement<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when changing the affinity.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Tell the scheduler we changes somethin=
g about affinity,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and ask to re-evaluate vcpu placement.=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( which =3D=3D v-&gt;cpu_hard_affinity )<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, affinity, =
NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(which =3D=3D v-&gt;cpu_so=
ft_affinity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, NULL, affi=
nity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(_VPF_migrating, &amp;v-&gt;pause_=
flags);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1100,7 +1133,7 @@ int vcpu_pin_override(struct vcpu *v, int cpu)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( v-&gt;affinity_broken )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_hard_affi=
nity, v-&gt;cpu_hard_affinity_saved);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, v-&gt;cpu_=
hard_affinity_saved, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;affinity_broken =3D 0=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(_VPF_migrating, &am=
p;v-&gt;pause_flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
@@ -1114,7 +1147,7 @@ int vcpu_pin_override(struct vcpu *v, int cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpumask_copy(v-&gt;cpu_hard=
_affinity_saved, v-&gt;cpu_hard_affinity);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;affinity_broken =3D 1=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpumask_copy(v-&gt;cpu_hard_affi=
nity, cpumask_of(cpu));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_affinity(v, cpumask_of=
(cpu), NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(_VPF_migrating, &am=
p;v-&gt;pause_flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/xen/include/xen/sched-if.h b/xen/include/xen/sched-if.h<br>
index c5dd43ed9c..926d063ccf 100644<br>
--- a/xen/include/xen/sched-if.h<br>
+++ b/xen/include/xen/sched-if.h<br>
@@ -173,6 +173,9 @@ struct scheduler {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int);<b=
r>
=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*adjust)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(const struct scheduler *, struct domain *,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct xen_domct=
l_scheduler_op *);<br>
+=C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*adjust_affinity)(con=
st struct scheduler *, struct vcpu *,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct cpumask *=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct cpumask *=
);<br>
=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*adjust_global)=
=C2=A0 (const struct scheduler *,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct xen_sysct=
l_scheduler_op *);<br>
=C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*dump_settings)=
=C2=A0 (const struct scheduler *);<br>
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h<br>
index 39f938644a..ade4d7b9aa 100644<br>
--- a/xen/include/xen/sched.h<br>
+++ b/xen/include/xen/sched.h<br>
@@ -846,6 +846,9 @@ void scheduler_free(struct scheduler *sched);<br>
=C2=A0int schedule_cpu_switch(unsigned int cpu, struct cpupool *c);<br>
=C2=A0void vcpu_force_reschedule(struct vcpu *v);<br>
=C2=A0int cpu_disable_scheduler(unsigned int cpu);<br>
+/* We need it in dom0_setup_vcpu */<br>
+void sched_set_affinity(struct vcpu *v, const cpumask_t *hard,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const cpumask_t *soft);<br>
=C2=A0int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity)=
;<br>
=C2=A0int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity)=
;<br>
=C2=A0void restore_vcpu_affinity(struct domain *d);<br>
<br>
</blockquote></div></div></div>

--001a113de8fcbc14bd0567783e0a--


--===============1006366394264964400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1006366394264964400==--
