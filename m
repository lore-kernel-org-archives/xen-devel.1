From: Diego Alejandro Parra Guzman <daparrag@correo.udistrital.edu.co>
Subject: Re: Performance Monitor and Profiling tools for ARM64
Date: Wed, 3 Apr 2019 08:57:07 +0200
Message-ID: <CAMWmVVAMYMa-csRVL3kz3KcafEzjRnQqz=0F5f_JLxy0_FQJew@mail.gmail.com>
References: <CAMWmVVANRaJX_Cx6OEHuKYR=v7nNfvPpW738_2hbhB+1s7w4LQ@mail.gmail.com>
 <7ed4f8ed-2317-5cee-e25c-69debc379fd8@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5283422340906242356=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04JA=SF=correo.udistrital.edu.co=daparrag@srs-us1.protection.inumbo.net>)
 id 1hBZpq-0007qi-Ov
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 06:57:22 +0000
Received: by mail-lj1-x22a.google.com with SMTP id l7so13812735ljg.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2019 23:57:20 -0700 (PDT)
In-Reply-To: <7ed4f8ed-2317-5cee-e25c-69debc379fd8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============5283422340906242356==
Content-Type: multipart/alternative; boundary="000000000000ba8e3705859ac3ef"

--000000000000ba8e3705859ac3ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien Grall

thank you for your replied,  you have clarified many of my doubts.

I have been implementing some basic functionality for the PMU :

Here small description:

   - getpmuinfo_attr :                             /* @brief  get PMU info,
   including number of Counters, and control counters */
   - enable_all_pmu_counters:              /* @brief  Enable the cycle
   counter register PMCCNTR_EL0, and any implemented event counter
   PMEVCNTR<n>_EL0 */
   - disable_all_pmu_counters              /* @brief  Disable the cycle
   counter register PMCCNTR_EL0, and any implemented event counter
   PMEVCNTR<n>_EL0. */
   - reset_all_pmu_counters                  /* @brief  Reset the cycle
   counter register PMCCNTR_EL0,  and any implemented event counter
   PMEVCNTR<n>_EL0.*/
   - enable_user_pmu_access              /* @brief  Enable user-mode access
   to counters.*/

I think these can be used as primitives for XEN:

Now I have some additional questions about XEN:

   - how can I include that primitives as a driver for ARM64 in XEN?

I've noticed that in linux kernel 4.14 - 4.15  $SOURCE/drivers/perf :

   - there is and implementation for arm_pmu  which is far better than what
   I've implemented, is it hard to import that driver to XEN ?
   - again how can I include that primitives as a driver for ARM64 in XEN?
   - PMU is implemented for each CPU so how to deal with that?

if you answer these questions will be really useful for me.
thank you.
BR
Diego.







On Fri, 22 Mar 2019 at 15:17, Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 22/03/2019 07:25, Diego Alejandro Parra Guzman wrote:
> > HI Everyone
>
> Hi Diego,
>
> > My name is diego. I'm very interesting in extend the XenOprof to ARM64
> based
> > architectures, and also integrate some tools for hypervisor and
> application
> > profiling and performance evaluation.
> >
> > I read the documentation for Oprofile a perf which is in the wiki page
> and I
> > noticed that XEN doesn't support ARM64 architectures.  For this reason =
I
> have
> > two ideas.
>
> Thank you for your interest to add perf support in Xen on Arm.
>
> >
> > 1. Add support for ARM64 architectures to XenOprof  in its current
> implementation.
> >
> > 2. I found an interesting library called libpfm4 which also work with
> > perf_event, and support ARM64 and ARM32 architectures. Well I can tray
> to use
> > this library in order to profile DOM0 and DOMU-VP guest.
> >
> > Personally I prefer the option 2 since the  library currently works in
> normal
> > linux OS and I guest could be easy to replicate it on XEN.
> >
> > Approaches:
> >
> > (hypercalls) from DOM0-DOMU to xen
> >
> > (direct pass through from DOM0 to PMU counters), and VPMU in DOMU .
>
> I think there are two (more or less distinct) use cases to take into
> account:
>    1) A guest profiling itself
>    2) The hypervisor profiling the system (i.e guests and itself).
>
>  From my understanding, the latter is implemented using XenOprof. For the
> former, then giving direct access to the PMU counters is probably a bette=
r
> approach over a PV solution.
>
> >
> > Here my questions?
> >
> > I would like to know if currently DOM0 and DOMU have support to
> perf_event
> > i.e., they can read directly performance monitoring unit (PMU) counters=
,
> only
> > DOM0 or none of them?
>
> Currently, there are no PMU support for Dom0 and DomU.
>
> >
> > should I implement some traps in XEN hypervisor ?
>
> The registers are already trapped (see arch/arm64/vsysregs.c) and
> implemented as
> a NOP for now. Depending on your use case, then trapping the registers ma=
y
> not
> be necessary (see more below).
>
> >
> > someone  currently  is working on this?
>
> I am not aware of anyone working on it so far.
>
> >
> > Which is the most efficient way to implement it ?
>
> I haven't fully thought through. The two use cases I mentioned above are
> quite
> distinct in term of implementation. It would probably be easy to implemen=
t
> them
> separately, but would require more thoughts if you want to handle the bot=
h
> at
> the same time.
>
> In the case of guest profiling itself, then I think you could just disabl=
e
> the
> traps and context switch the registers. You will also need to forward the
> PMU
> interrupts (such as the overflow one) to the domains. For accuracy, you
> may also
> need to enable/disable PMU counters (see PMCR_EL0) on each traps so you
> don't
> count events in the hypervisor. Unless there are a way to ignore events
> when at
> running at EL2 (I haven't explored the spec yet).
>
> In the case of the hypervisor profiling system, you would need to
> implement a
> PMU drivers in Xen. I don't know much about xenoprofile to be able to giv=
e
> more
> details here.
>
> >
> > There is a guide line to do this easily?
> I am afraid there are no silver bullet. You would need to read the ARM AR=
M
> section about the PMU and look at the xenoprofile code. I would be happy
> to
> answer any specific question if you are not understand some part of the
> code.
>
> Cheers,
>
> --
> Julien Grall
>


--=20
Diego Alejandro Parra Guzm=C3=A1n
Estudiante de ingenier=C3=ADa electr=C3=B3nica
Universidad distrital FJC

--000000000000ba8e3705859ac3ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
><h3 class=3D"m_-6486577282910761618gmail-iw" style=3D"overflow:hidden;whit=
e-space:nowrap;font-size:0.75rem;font-weight:inherit;margin:inherit;text-ov=
erflow:ellipsis;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;l=
etter-spacing:0.3px;color:rgb(95,99,104);line-height:20px"><span class=3D"m=
_-6486577282910761618gmail-qu" style=3D"outline:none"><span name=3D"Julien =
Grall" class=3D"m_-6486577282910761618gmail-gD" style=3D"color:rgb(32,33,36=
);font-size:0.875rem;font-weight:bold;display:inline;vertical-align:top;let=
ter-spacing:0.2px;line-height:20px">Hello Julien Grall</span></span></h3></=
div><div><br></div>thank you for your replied,=C2=A0 you have clarified man=
y of my doubts.=C2=A0<div><br></div><div>I have been implementing some basi=
c functionality for the PMU :=C2=A0</div><div><br></div><div>Here small des=
cription:=C2=A0</div><div><ul><li>getpmuinfo_attr :=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* @brief=C2=A0 get PMU info, including number of Counters, and contr=
ol counters */<br></li><li>enable_all_pmu_counters:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* @brief=C2=A0 Enable the cycle counter register =
PMCCNTR_EL0, and any implemented event counter PMEVCNTR&lt;n&gt;_EL0 */=C2=
=A0=C2=A0<br></li><li>disable_all_pmu_counters=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0

/* @brief=C2=A0 Disable the cycle counter register PMCCNTR_EL0,=C2=A0and an=
y implemented event counter PMEVCNTR&lt;n&gt;_EL0. */=C2=A0=C2=A0=C2=A0=C2=
=A0<br></li><li>reset_all_pmu_counters=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* @brief=C2=A0 Reset the cycle counter registe=
r PMCCNTR_EL0,=C2=A0=C2=A0and any implemented event counter PMEVCNTR&lt;n&g=
t;_EL0.*/=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</li><li>enable_user_pmu_access=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* @brief=C2=A0 Enable user-m=
ode access to counters.*/=C2=A0=C2=A0</li></ul><div>I think these can be us=
ed as primitives for XEN:=C2=A0</div><div><br></div>Now I have some additio=
nal questions about XEN:</div><div><ul><li>how can I include that primitive=
s as a driver for ARM64 in XEN?</li></ul>I&#39;ve noticed that in linux ker=
nel 4.14 - 4.15=C2=A0 $SOURCE/drivers/perf :</div><div><ul><li>there is and=
 implementation for arm_pmu=C2=A0 which is far better than what I&#39;ve im=
plemented, is it hard to import that driver to XEN ?</li><li>again how can =
I include that primitives as a driver for ARM64 in XEN?</li><li>PMU is impl=
emented for each CPU so how to deal with that?</li></ul>if you answer these=
 questions will be really useful for me.=C2=A0</div><div>thank you.</div><d=
iv>BR</div><div>Diego.=C2=A0</div><div><br></div><div><br></div><div>=C2=A0=
 =C2=A0 =C2=A0<br></div><div><br></div><div><br></div><div><br></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 2=
2 Mar 2019 at 15:17, Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.co=
m" target=3D"_blank">julien.grall@arm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 22/03/2019 07:25, Diego Alejandro Parra Guzman wrote:<br>
&gt; HI Everyone<br>
<br>
Hi Diego,<br>
<br>
&gt; My name is diego. I&#39;m very interesting in extend the XenOprof to A=
RM64 based <br>
&gt; architectures, and also integrate some tools for hypervisor and applic=
ation <br>
&gt; profiling and performance evaluation.<br>
&gt; <br>
&gt; I read the documentation for Oprofile a perf which is in the wiki page=
 and I <br>
&gt; noticed that XEN doesn&#39;t support ARM64 architectures.=C2=A0 For th=
is reason I have <br>
&gt; two ideas.<br>
<br>
Thank you for your interest to add perf support in Xen on Arm.<br>
<br>
&gt; <br>
&gt; 1. Add support for ARM64 architectures to XenOprof=C2=A0 in its curren=
t implementation.<br>
&gt; <br>
&gt; 2. I found an interesting library called libpfm4 which also work with =
<br>
&gt; perf_event, and support ARM64 and ARM32 architectures. Well I can tray=
 to use <br>
&gt; this library in order to profile DOM0 and DOMU-VP guest.<br>
&gt; <br>
&gt; Personally I prefer the option 2 since the=C2=A0 library currently wor=
ks in normal <br>
&gt; linux OS and I guest could be easy to replicate it on XEN.<br>
&gt; <br>
&gt; Approaches:<br>
&gt; <br>
&gt; (hypercalls) from DOM0-DOMU to xen<br>
&gt; <br>
&gt; (direct pass through from DOM0 to PMU counters), and VPMU in DOMU .<br=
>
<br>
I think there are two (more or less distinct) use cases to take into accoun=
t:<br>
=C2=A0 =C2=A01) A guest profiling itself<br>
=C2=A0 =C2=A02) The hypervisor profiling the system (i.e guests and itself)=
.<br>
<br>
=C2=A0From my understanding, the latter is implemented using XenOprof. For =
the <br>
former, then giving direct access to the PMU counters is probably a better =
<br>
approach over a PV solution.<br>
<br>
&gt; <br>
&gt; Here my questions?<br>
&gt; <br>
&gt; I would like to know if currently DOM0 and DOMU have support to=C2=A0 =
perf_event <br>
&gt; i.e., they can read directly performance monitoring unit (PMU) counter=
s, only <br>
&gt; DOM0 or none of them?<br>
<br>
Currently, there are no PMU support for Dom0 and DomU.<br>
<br>
&gt; <br>
&gt; should I implement some traps in XEN hypervisor ?<br>
<br>
The registers are already trapped (see arch/arm64/vsysregs.c) and implement=
ed as <br>
a NOP for now. Depending on your use case, then trapping the registers may =
not <br>
be necessary (see more below).<br>
<br>
&gt; <br>
&gt; someone=C2=A0 currently=C2=A0 is working on this?<br>
<br>
I am not aware of anyone working on it so far.<br>
<br>
&gt; <br>
&gt; Which is the most efficient way to implement it ?<br>
<br>
I haven&#39;t fully thought through. The two use cases I mentioned above ar=
e quite <br>
distinct in term of implementation. It would probably be easy to implement =
them <br>
separately, but would require more thoughts if you want to handle the both =
at <br>
the same time.<br>
<br>
In the case of guest profiling itself, then I think you could just disable =
the <br>
traps and context switch the registers. You will also need to forward the P=
MU <br>
interrupts (such as the overflow one) to the domains. For accuracy, you may=
 also <br>
need to enable/disable PMU counters (see PMCR_EL0) on each traps so you don=
&#39;t <br>
count events in the hypervisor. Unless there are a way to ignore events whe=
n at <br>
running at EL2 (I haven&#39;t explored the spec yet).<br>
<br>
In the case of the hypervisor profiling system, you would need to implement=
 a <br>
PMU drivers in Xen. I don&#39;t know much about xenoprofile to be able to g=
ive more <br>
details here.<br>
<br>
&gt; <br>
&gt; There is a guide line to do this easily?<br>
I am afraid there are no silver bullet. You would need to read the ARM ARM =
<br>
section about the PMU and look at the xenoprofile code. I would be happy to=
 <br>
answer any specific question if you are not understand some part of the cod=
e.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_-6486577282910761618gmail_signature">Diego Alejandro Parr=
a Guzm=C3=A1n<br>Estudiante de ingenier=C3=ADa electr=C3=B3nica<br>Universi=
dad distrital FJC<br></div>

--000000000000ba8e3705859ac3ef--


--===============5283422340906242356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5283422340906242356==--
