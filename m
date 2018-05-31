From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 05/13] xen/arm: Add command line option to
 control SSBD mitigation
Date: Thu, 31 May 2018 22:29:48 +0100
Message-ID: <CAF3u54By5NfOwJewzoLzyi7pZO=7XrWPpW2JR-VFucnt=oCndA@mail.gmail.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-6-julien.grall@arm.com>
 <alpine.DEB.2.10.1805231504320.15101@sstabellini-ThinkPad-X260>
 <614031dd-3825-5c69-9083-7ececc303f34@arm.com>
 <alpine.DEB.2.10.1805251234100.12008@sstabellini-ThinkPad-X260>
 <8eeddff3-07b4-48ea-b599-02b89ccf887c@arm.com>
 <alpine.DEB.2.10.1805291445240.5563@sstabellini-ThinkPad-X260>
 <dff77236-51d7-41bd-ad74-3b2ea6bcedcb@arm.com>
 <alpine.DEB.2.10.1805301228400.23991@sstabellini-ThinkPad-X260>
 <a0e8b612-b5c0-113a-9171-eda68f4abd18@arm.com>
 <alpine.DEB.2.10.1805311350430.23991@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6146433107454824114=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oktx=is=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fOV91-0004E6-5R
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 21:30:03 +0000
Received: by mail-ot0-x244.google.com with SMTP id q17-v6so16389940otg.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 May 2018 14:30:01 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1805311350430.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6146433107454824114==
Content-Type: multipart/alternative; boundary="00000000000076d479056d872b5d"

--00000000000076d479056d872b5d
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On Thu, 31 May 2018, 22:00 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 31 May 2018, Julien Grall wrote:
> > Hi,
> >
> > On 30/05/18 21:10, Stefano Stabellini wrote:
> > > On Wed, 30 May 2018, Julien Grall wrote:
> > > > On 05/29/2018 11:34 PM, Stefano Stabellini wrote:
> > > > > On Tue, 29 May 2018, Julien Grall wrote:
> > > > > > On 25/05/18 21:51, Stefano Stabellini wrote:
> > > > > > > On Thu, 24 May 2018, Julien Grall wrote:
> > > > > > > > On 23/05/18 23:34, Stefano Stabellini wrote:
> > > > > > > > > On Tue, 22 May 2018, Julien Grall  >>>>
> > > I should have read the spec more carefully, thanks for the pointer.
> > > Sorry about that. Finally, these patches are starting to make sense :-)
> > >
> > > All right. I can see why ssbd_state and ssbd_callback_required are
> > > separate and their purpose. Aside from adding more info to the commit
> > > message, I'll make a couple of different suggestions:
> > >
> > > 1) Let's check if ssbd_state == ARM_SSBD_UNKNOWN || ssbd_state ==
> > > ARM_SSBD_MITIGATED at the beginning of has_ssbd_mitigation and return
>
> > > early in that case. This will help clarify the intended behavior and
> > > mitigate broken firmware returning ARM_SMCCC_NOT_SUPPORTED only on some
> > > cpus. This is just optional, I am fine either way.
> > A vendor not able to do a simple return "ARM_SMCCC_NOT_SUPPORTED" in
> their
> > firmware are not worth to support it in Xen. Most likely, more important
> bits
> > of that firmware would be broken.
> >
> > >
> > > 2) Can we turn ssbd_callback_required from a this_cpu variable to a
> > > single cpu bitmask? It is not great to introduce a new per-cpu varible
> > > for just one bit. It would save space and make it easier to access from
> > > assembly as a bitmask as it would remove the need for the ldr_this_cpu
> > > macro. If I am wrong and the bitmask makes things more complicated
> > > rather than simpler, then keep the code as is and just mention it in
> the
> > > next version of the patch.
> >
> > I hope you are aware that this will only save 8 byte per-CPU. On most of
> > embedded platform you will have less than 16 CPUs. So you would save at
> most
> > 128 bytes (woah!). If you are that tight in memory, then there are better
> > place to reduce the footprint.
> >
> > I am also not sure to understand the problem of having ldr_this_cpu
> around.
> > The macro is simple and in any case, you would still require at least a
> load
> > for the bitmask.
> >
> > Feel free to suggest an assembly version for the bitmask.
>
> OK, this is very simple, the first that came to mind, I am sure you can
> improve it:
>
>         // 65 is the cpu number, in this example
>         MOV X1, #65
>
>         // X1 tells us which doubleword to consider
>         // X2 has the bit shift for right doubleword
>         // X3 is the shifted X2, we'll use it to check the bitmask
>         AND X2, X1, #(64-1)
>         LSR X1, X1, #3
>         MOV X3, #0x1
>         LSL X3, X3, X2
>
>         // we load the pointer to the bitmask in X4
>         LDR X4, =cpumask
>         // increase the pointer to point to the right doubleword
>         ADD X4, X4, X1
>         // load the doubleword
>         LDR X4, [X4]
>         // mask with X3, the result is in X1
>         AND X1, X4, X3
>

Well, because of the SMCC v1.1 convention, you can only use x0-x3. So x4 is
a no go.

You also cannot use x1 because it contains the enable/disable boolean.

Furthermore ldr_this_cpu is only 3 instructions. With your current
solution, you have 9 instructions.
Even optimized, I honestly doubt you will manage 3 instructions. This is
30% more instructions!

So you are maybe going to save few bytes in memory, but everytime you
execute the SMC you will lose some time. As this is happening at every
entry/exit from EL0, this will have a significant impact on your workload.

At this stage, I will keep with the percpu variable. That's the best
trade-off between performance and footprint.

Cheers,

--00000000000076d479056d872b5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>(sorry for the formatting)</span><br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Thu, 31 May 2018, 22:00 Stefano Stabellini, &lt;<a href=
=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Thu, 31 May 2018, Julien Grall wro=
te:<br>
&gt; Hi,<br>
&gt; <br>
&gt; On 30/05/18 21:10, Stefano Stabellini wrote:<br>
&gt; &gt; On Wed, 30 May 2018, Julien Grall wrote:<br>
&gt; &gt; &gt; On 05/29/2018 11:34 PM, Stefano Stabellini wrote:<br>
&gt; &gt; &gt; &gt; On Tue, 29 May 2018, Julien Grall wrote:<br>
&gt; &gt; &gt; &gt; &gt; On 25/05/18 21:51, Stefano Stabellini wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Thu, 24 May 2018, Julien Grall wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On 23/05/18 23:34, Stefano Stabellini wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Tue, 22 May 2018, Julien Grall=
=C2=A0 &gt;&gt;&gt;&gt;<br>
&gt; &gt; I should have read the spec more carefully, thanks for the pointe=
r.<br>
&gt; &gt; Sorry about that. Finally, these patches are starting to make sen=
se :-)<br>
&gt; &gt; <br>
&gt; &gt; All right. I can see why ssbd_state and ssbd_callback_required ar=
e<br>
&gt; &gt; separate and their purpose. Aside from adding more info to the co=
mmit<br>
&gt; &gt; message, I&#39;ll make a couple of different suggestions:<br>
&gt; &gt; <br>
&gt; &gt; 1) Let&#39;s check if ssbd_state =3D=3D ARM_SSBD_UNKNOWN || ssbd_=
state =3D=3D<br>
&gt; &gt; ARM_SSBD_MITIGATED at the beginning of has_ssbd_mitigation and re=
turn=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; early in that case. This will help clarify the intended behavior =
and<br>
&gt; &gt; mitigate broken firmware returning ARM_SMCCC_NOT_SUPPORTED only o=
n some<br>
&gt; &gt; cpus. This is just optional, I am fine either way.<br>
&gt; A vendor not able to do a simple return &quot;ARM_SMCCC_NOT_SUPPORTED&=
quot; in their<br>
&gt; firmware are not worth to support it in Xen. Most likely, more importa=
nt bits<br>
&gt; of that firmware would be broken.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; 2) Can we turn ssbd_callback_required from a this_cpu variable to=
 a<br>
&gt; &gt; single cpu bitmask? It is not great to introduce a new per-cpu va=
rible<br>
&gt; &gt; for just one bit. It would save space and make it easier to acces=
s from<br>
&gt; &gt; assembly as a bitmask as it would remove the need for the ldr_thi=
s_cpu<br>
&gt; &gt; macro. If I am wrong and the bitmask makes things more complicate=
d<br>
&gt; &gt; rather than simpler, then keep the code as is and just mention it=
 in the<br>
&gt; &gt; next version of the patch.<br>
&gt; <br>
&gt; I hope you are aware that this will only save 8 byte per-CPU. On most =
of<br>
&gt; embedded platform you will have less than 16 CPUs. So you would save a=
t most<br>
&gt; 128 bytes (woah!). If you are that tight in memory, then there are bet=
ter<br>
&gt; place to reduce the footprint.<br>
&gt; <br>
&gt; I am also not sure to understand the problem of having ldr_this_cpu ar=
ound.<br>
&gt; The macro is simple and in any case, you would still require at least =
a load<br>
&gt; for the bitmask.<br>
&gt; <br>
&gt; Feel free to suggest an assembly version for the bitmask.<br>
<br>
OK, this is very simple, the first that came to mind, I am sure you can<br>
improve it:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // 65 is the cpu number, in this example<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MOV X1, #65<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // X1 tells us which doubleword to consider<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // X2 has the bit shift for right doubleword<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // X3 is the shifted X2, we&#39;ll use it to ch=
eck the bitmask<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AND X2, X1, #(64-1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LSR X1, X1, #3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MOV X3, #0x1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LSL X3, X3, X2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // we load the pointer to the bitmask in X4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LDR X4, =3Dcpumask<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // increase the pointer to point to the right d=
oubleword<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ADD X4, X4, X1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // load the doubleword<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LDR X4, [X4]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // mask with X3, the result is in X1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AND X1, X4, X3<br></blockquote></div><div><br><=
/div><div>Well, because of the SMCC v1.1 convention, you can only use x0-x3=
. So x4 is a no go.</div><div><br></div><div>You also cannot use x1 because=
 it contains the enable/disable boolean.</div><div><br></div><div>Furthermo=
re ldr_this_cpu is only 3 instructions. With your current solution, you hav=
e 9 instructions.</div><div>Even optimized, I honestly doubt you will manag=
e 3 instructions. This is 30% more instructions!</div><div><br></div><div>S=
o you are maybe going to save few bytes in memory, but everytime you execut=
e the SMC you will lose some time. As this is happening at every entry/exit=
 from EL0, this will have a significant impact on your workload.</div><div>=
<br></div><div>At this stage, I will keep with the percpu variable. That&#3=
9;s the best trade-off between performance and footprint.</div><div><br></d=
iv><div>Cheers,</div>

--00000000000076d479056d872b5d--


--===============6146433107454824114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6146433107454824114==--
