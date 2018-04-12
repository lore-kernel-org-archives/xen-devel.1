From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 7/7] xen/arm: Restore IRQ affinity after
 hotplugging a CPU
Date: Thu, 12 Apr 2018 09:38:27 +0200
Message-ID: <CAKPH-NhToxZsGccAGsR+reb+Dy-ocuyS9m5Gi=Bnz8FQT1sbRA@mail.gmail.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <20180411131927.27083-8-mirela.simonovic@aggios.com>
 <alpine.DEB.2.10.1804111710270.3304@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6712221998106347343=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1804111710270.3304@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, julien.grall@arm.org, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6712221998106347343==
Content-Type: multipart/alternative; boundary="001a114abe806888ec0569a1d710"

--001a114abe806888ec0569a1d710
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

v->processor has to be updated before the sched_move_irqs is called. Since
updating v->processor is done after the 'if (v->affinity_broken)' check I
had to put sched_move_irqs below, where it is.

Thanks,
Mirela

On Thu, Apr 12, 2018 at 2:20 AM, Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Wed, 11 Apr 2018, Mirela Simonovic wrote:
> > Secondary pCPUs will be offlined on system suspend and hotplugged
> > on resume. When offlining secondary CPUs all interrupts targeted
> > to those CPUs will be routed to the boot CPU. The boot CPU
> > is responsible for finalizing suspend procedure. All wake-up
> > interrupts are therefore targeted to the boot CPU. Existing code
> > was missing the restoration of interrupts affinity after
> > hotplugging a CPU. This patch restores the IRQ affinity after
> > a CPU is hotplugged.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > ---
> >  xen/common/schedule.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> > index 343ab6306e..e3956019bc 100644
> > --- a/xen/common/schedule.c
> > +++ b/xen/common/schedule.c
> > @@ -692,6 +692,7 @@ void restore_vcpu_affinity(struct domain *d)
> >      for_each_vcpu ( d, v )
> >      {
> >          spinlock_t *lock;
> > +        bool affinity_was_broken = v->affinity_broken;
> >
> >          ASSERT(!vcpu_runnable(v));
> >
> > @@ -724,6 +725,9 @@ void restore_vcpu_affinity(struct domain *d)
> >          lock = vcpu_schedule_lock_irq(v);
> >          v->processor = SCHED_OP(vcpu_scheduler(v), pick_cpu, v);
> >          spin_unlock_irq(lock);
> > +
> > +        if ( affinity_was_broken )
> > +            sched_move_irqs(v);
> >      }
> >
> >      domain_update_node_affinity(d);
>
> I am no expert of this code, but it looks correct to me. You might want
> to move the setting of affinity_was_broken to inside the existing if (
> v->affinity_broken ) check.
>

--001a114abe806888ec0569a1d710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>v-&gt;processor has to be u=
pdated before the=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">sched_move_irqs is called=
. Since updating <span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">v-&gt;processor=C2=A0</span>is d=
one after the &#39;<span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">if (</span><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">v-&gt;affinity_broken)&#39; check I had to put <span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">sched_move_irqs below, where it is.</span></span></span></div><div>=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line"><br></span></span></span></div><div><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">Thanks,</span></span></span=
></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">Mirela</span></span></span></div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Thu, Apr 12, 2018 at 2:20 AM, St=
efano Stabellini <span dir=3D"ltr">&lt;<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Wed,=
 11 Apr 2018, Mirela Simonovic wrote:<br>
&gt; Secondary pCPUs will be offlined on system suspend and hotplugged<br>
&gt; on resume. When offlining secondary CPUs all interrupts targeted<br>
&gt; to those CPUs will be routed to the boot CPU. The boot CPU<br>
&gt; is responsible for finalizing suspend procedure. All wake-up<br>
&gt; interrupts are therefore targeted to the boot CPU. Existing code<br>
&gt; was missing the restoration of interrupts affinity after<br>
&gt; hotplugging a CPU. This patch restores the IRQ affinity after<br>
&gt; a CPU is hotplugged.<br>
&gt;<br>
&gt; Signed-off-by: Mirela Simonovic &lt;<a href=3D"mailto:mirela.simonovic=
@aggios.com">mirela.simonovic@aggios.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/schedule.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/xen/common/schedule.c b/xen/common/schedule.c<br>
&gt; index 343ab6306e..e3956019bc 100644<br>
&gt; --- a/xen/common/schedule.c<br>
&gt; +++ b/xen/common/schedule.c<br>
&gt; @@ -692,6 +692,7 @@ void restore_vcpu_affinity(struct domain *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for_each_vcpu ( d, v )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t *lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool affinity_was_broken =3D v-&gt;affini=
ty_broken;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(!vcpu_runnable(v));<br>
&gt;<br>
&gt; @@ -724,6 +725,9 @@ void restore_vcpu_affinity(struct domain *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D vcpu_schedule_lock_irq(v);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;processor =3D SCHED_OP(vcpu_sc=
heduler(v), pick_cpu, v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( affinity_was_broken )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_move_irqs(v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 domain_update_node_affinity(d)<wbr>;<br>
<br>
</div></div>I am no expert of this code, but it looks correct to me. You mi=
ght want<br>
to move the setting of affinity_was_broken to inside the existing if (<br>
v-&gt;affinity_broken ) check.<br>
</blockquote></div><br></div>

--001a114abe806888ec0569a1d710--


--===============6712221998106347343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6712221998106347343==--
