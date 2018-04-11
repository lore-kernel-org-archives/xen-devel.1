From: Dario Faggioli <raistlin@linux.it>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 21:31:57 +0000
Message-ID: <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de>
 <20180411150312.GL7177@aepfle.de> <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1955903149705592621=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411204359.GP7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============1955903149705592621==
Content-Type: multipart/alternative; boundary="000000000000fc5fb70569995e00"

--000000000000fc5fb70569995e00
Content-Type: text/plain; charset="UTF-8"

Il Mer 11 Apr 2018, 22:48 Olaf Hering <olaf@aepfle.de> ha scritto:

> On Wed, Apr 11, Dario Faggioli wrote:
>
> > It will crash, again, possibly with the same stack trace, but I think
> > it's worth a try.
>
>     BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));
>
> (XEN) Xen BUG at sched_credit.c:876
> (XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-7.bug1087289_411  x86_64
> debug=y   Not tainted ]----
> (XEN) CPU:    108
> (XEN) RIP:    e008:[<ffff82d080229ab4>]
> sched_credit.c#csched_vcpu_migrate+0x27/0x54
> (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d080229ab4>] sched_credit.c#csched_vcpu_migrate+0x27/0x54
> (XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
> (XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
> (XEN)    [<ffff82d080239367>] context_saved+0x95/0x9c
> (XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
> (XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
> (XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
> (XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
> (XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
>

So, really *exactly* the same. Ok, thanks.

I think that from "CONTEXT: hypervisor", we can tell that the current vcpu
is the idle one, and I'm starting to wonder whether the lazy context switch
logic may play a role in all this.

But, for now, it's just a gut feeling. I'll investigate tomorrow.

Another thing we could do, would be to try George's migratiin refactoring
series. I haven't reviewed it in details yet, but it seemed reasonable at a
first glance.

Not that that could be the solution (backportabiliry, ecc), but, if it
works, it might give us ideas on where to look, and on how to produce a
stepgap patch, "just" solving the issue.

Thanks and regards,
Dario

--000000000000fc5fb70569995e00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Il Mer 1=
1 Apr 2018, 22:48 Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@ae=
pfle.de</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed,=
 Apr 11, Dario Faggioli wrote:<br>
<br>
&gt; It will crash, again, possibly with the same stack trace, but I think<=
br>
&gt; it&#39;s worth a try.<br>
<br>
=C2=A0 =C2=A0 BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));<br><br>
(XEN) Xen BUG at sched_credit.c:876<br>
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-7.bug1087289_411=C2=A0 x86_=
64=C2=A0 debug=3Dy=C2=A0 =C2=A0Not tainted ]----<br>
(XEN) CPU:=C2=A0 =C2=A0 108<br>
(XEN) RIP:=C2=A0 =C2=A0 e008:[&lt;ffff82d080229ab4&gt;] sched_credit.c#csch=
ed_vcpu_migrate+0x27/0x54<br>
(XEN) RFLAGS: 0000000000010006=C2=A0 =C2=A0CONTEXT: hypervisor<br>...<br>
(XEN) Xen call trace:<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080229ab4&gt;] sched_credit.c#csched_vcpu_mi=
grate+0x27/0x54<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080236348&gt;] schedule.c#vcpu_move_locked+0=
xbb/0xc2<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d08023764c&gt;] schedule.c#vcpu_migrate+0x226=
/0x25b<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080239367&gt;] context_saved+0x95/0x9c<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d08027797d&gt;] context_switch+0xe66/0xeb0<br=
>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080236943&gt;] schedule.c#schedule+0x5f4/0x6=
27<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080239f15&gt;] softirq.c#__do_softirq+0x85/0=
x90<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080239f6a&gt;] do_softirq+0x13/0x15<br>
(XEN)=C2=A0 =C2=A0 [&lt;ffff82d08031f5db&gt;] vmx_asm_do_vmentry+0x2b/0x30<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div dir=3D"auto" style=3D"font-family:sans-serif">So, really *exactly* the =
same. Ok, thanks.</div><div dir=3D"auto" style=3D"font-family:sans-serif"><=
br></div><div dir=3D"auto" style=3D"font-family:sans-serif">I think that fr=
om &quot;CONTEXT: hypervisor&quot;, we can tell that the current vcpu is th=
e idle one, and I&#39;m starting to wonder whether the lazy context switch =
logic may play a role in all this.</div><div dir=3D"auto" style=3D"font-fam=
ily:sans-serif"><br></div><div dir=3D"auto" style=3D"font-family:sans-serif=
">But, for now, it&#39;s just a gut feeling. I&#39;ll investigate tomorrow.=
</div><div dir=3D"auto" style=3D"font-family:sans-serif"><br></div><div dir=
=3D"auto" style=3D"font-family:sans-serif">Another thing we could do, would=
 be to try George&#39;s migratiin refactoring series. I haven&#39;t reviewe=
d it in details yet, but it seemed reasonable at a first glance.</div><div =
dir=3D"auto" style=3D"font-family:sans-serif"><br></div><div dir=3D"auto" s=
tyle=3D"font-family:sans-serif">Not that that could be the solution (backpo=
rtabiliry, ecc), but, if it works, it might give us ideas on where to look,=
 and on how to produce a stepgap patch, &quot;just&quot; solving the issue.=
</div><div dir=3D"auto" style=3D"font-family:sans-serif"><br></div><div dir=
=3D"auto" style=3D"font-family:sans-serif">Thanks and regards,</div><div di=
r=3D"auto" style=3D"font-family:sans-serif">Dario</div></div></div>

--000000000000fc5fb70569995e00--


--===============1955903149705592621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1955903149705592621==--
