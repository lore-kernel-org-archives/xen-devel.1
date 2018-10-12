From: Julien Grall <julien.grall@gmail.com>
Subject: Re: Xen optimization
Date: Fri, 12 Oct 2018 18:36:13 +0200
Message-ID: <CAF3u54CBpZ5_B28RbohV0c8LfbOht59c6yhbY9jA-ARwyZEKMw@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <alpine.DEB.2.10.1810111024390.436@sstabellini-ThinkPad-X260>
 <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6549488299877143070=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wl3n=my=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gB0QR-00042E-SN
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 16:36:31 +0000
Received: by mail-vs1-xe34.google.com with SMTP id m5so12434910vsk.6
 for <xen-devel@lists.xenproject.org>; Fri, 12 Oct 2018 09:36:29 -0700 (PDT)
In-Reply-To: <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, julien.grall@arm.com, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com
List-Id: xen-devel@lists.xenproject.org

--===============6549488299877143070==
Content-Type: multipart/alternative; boundary="00000000000076b60105780ab03e"

--00000000000076b60105780ab03e
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Fri, 12 Oct 2018, 17:36 Milan Boberic, <milanboberic94@gmail.com> wrote:

> Hi Stefano, glad to have you back :D,
> this is my setup:
>         - dom0 is PetaLinux, has 1 vCPU and it's pinned for pCPU0
>         - there is only one domU and this is my bare-metal app that also
> have one vCPU and it's pinned for pCPU1
> so yeah, there is only dom0 and bare-metal app on the board.
>
> Jitter is the same with and without Dario's patch.
>
> I'm still not sure about timer's passthrough because there is no mention
> of triple timer counter is device tree so I added:
>
> &ttc0 {
>    xen,passthrough = <0x1>;
> };
>

Would you mind to explain what is the triple timer counter?



> at the end of the xen-overlay.dtsi file which I included in attachment.
>
> About patch you sent, I can't find this funcion void vgic_inject_irq in
> /xen/arch/arm/vgic.c file, this is link of git repository from where I
> build my xen so you can take a look if that printk can be put somewhere
> else.
>

There was some vGIC rework in Xen 4.11. There was also a new vGIC added
(selectable using NEW_VGIC). It might be worth to look at it.


> https://github.com/Xilinx/xen/
>

This is not the official Xen repository and look like patches have been
applied on top. I am afraid, I am not going to be able help here. Could you
do the same experiment with Xen 4.11?


>
> I ran some more testing and realized that results are the same with or
> without vwfi=native, which I think again points out that passthrough that I
> need to provide in device tree isn't valid.
>

This could also means that wfi is not used by the guest or you never go to
the idle vCPU.


>  And of course, higher the frequency of interrupts results in higher
> jitter. I'm still battling with Xilinx SDK and triple timer counter that's
> why I can't figure out what is the exact frequency set (I'm just rising it
> and lowering it), I'll give my best to solve that ASAP because we need to
> know exact value of frequency set.
>
> Thanks in advance!
>
> Milan
>
>
>
> On Fri, Oct 12, 2018 at 12:29 AM Stefano Stabellini <
> stefano.stabellini@xilinx.com> wrote:
>
>> On Thu, 11 Oct 2018, Milan Boberic wrote:
>> > On Wed, Oct 10, 2018 at 6:41 PM Meng Xu <xumengpanda@gmail.com> wrote:
>> > >
>> > > The jitter may come from Xen or the OS in dom0.
>> > > It will be useful to know what is the jitter if you run the test on
>> PetaLinux.
>> > > (It's understandable the jitter is gone without OS. It is also common
>> > > that OS introduces various interferences.)
>> >
>> > Hi Meng,
>> > well... I'm using bare-metal application and I need it exclusively to
>> > be ran on one CPU as domU (guest) without OS (and I'm not sure how
>> > would I make the same app to be ran on PetaLinux dom0 :D haha).
>> > Is there a chance that PetaLinux as dom0 is creating this jitter and
>> > how? Is there a way of decreasing it?
>> >
>> > Yes, there are no prints.
>> >
>> > I'm not sure about this timer interrupt passthrough because I didn't
>> > find any example of it, in attachment I included xen-overlay.dtsi file
>> > which I edited to add passthrough, in earlier replies there are
>> > bare-metal configuration file. It would be helpful to know if those
>> > setting are correct. If they are not correct it would explain the
>> > jitter.
>> >
>> > Thanks in advance, Milan Boberic!
>>
>> Hi Milan,
>>
>> Sorry for taking so long to go back to this thread. But I am here now :)
>>
>> First, let me ask a couple of questions to understand the scenario
>> better: is there any interference from other virtual machines while you
>> measure the jitter? Or is the baremetal app the only thing actively
>> running on the board?
>>
>> Second, it would be worth double-checking that Dario's patch to fix
>> sched=null is not having unexpected side effects. I don't think so, it
>> would be worth testing with it and without it to be sure.
>>
>> I gave a look at your VM configuration. The configuration looks correct.
>> There is no dtdev settings, but given that none of the devices you are
>> assigning to the guest does any DMA, it should be OK. You want to make
>> sure that Dom0 is not trying to use those same devices -- make sure to
>> add "xen,passthrough;" to each corresponding node on the host device
>> tree.
>>
>> The error messages "No valid vCPU found" are due to the baremetal
>> applications trying to configure as target cpu for the interrupt cpu1
>> (the second cpu in the system), while actually only 1 vcpu is assigned
>> to the VM. Hence, only cpu0 is allowed. I don't think it should cause
>> any jitter issues, because the request is simply ignored. Just to be
>> safe, you might want to double check that the physical interrupt is
>> delivered to the right physical cpu, which would be cpu1 in your
>> configuration, the one running the only vcpu of the baremetal app. You
>> can do that by adding a printk to xen/arch/arm/vgic.c:vgic_inject_irq,
>> for example:
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 5a4f082..208fde7 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -591,6 +591,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu
>> *v, unsigned int virq,
>>  out:
>>      spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>>
>> +    if (v != current) printk("DEBUG irq slow path!\n");
>>      /* we have a new higher priority irq, inject it into the guest */
>>      vcpu_kick(v);
>>
>> You don't want "DEBUG irq slow path!" to get printed.
>>
>> Finally, I would try to set the timer to generate events less frequently
>> than every 1us and see what happens, maybe every 5-10us. In my tests,
>> the IRQ latency overhead caused by Xen is around 1us, so injecting 1
>> interrupt every 1us, plus 1us of latency caused by Xen, cannot lead to
>> good results.
>>
>> I hope this helps, please keep us updated with your results, they are
>> very interesting!
>>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000076b60105780ab03e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Fri, 12 Oct 2018, 17:36 Milan Boberic, &lt;<a h=
ref=3D"mailto:milanboberic94@gmail.com">milanboberic94@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Stefano, g=
lad to have you back :D,<br>this is my setup:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - dom0 is PetaLinux, has 1 vCPU and it&#39;s pinned for pCPU0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - there is only one domU and this is my bare-metal ap=
p that also have one vCPU and it&#39;s pinned for pCPU1<br>so yeah, there i=
s only dom0 and bare-metal app on the board.<br><br>Jitter is the same with=
 and without Dario&#39;s patch.<br><br>I&#39;m still not sure about timer&#=
39;s passthrough because there is no mention of triple timer counter is dev=
ice tree so I added:<br><br>&amp;ttc0 {<br>=C2=A0 =C2=A0xen,passthrough =3D=
 &lt;0x1&gt;;<br>};<br></div></blockquote></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Would you mind to explain what is the triple timer count=
er?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><br>at the end of the xen-overlay.dtsi file which I included in attachme=
nt.<br><br>About patch you sent, I can&#39;t find this funcion void vgic_in=
ject_irq in /xen/arch/arm/vgic.c file, this is link of git repository from =
where I build my xen so you can take a look if that printk can be put somew=
here else.</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">There was some vGIC rework in Xen 4.11. There was also a new vGIC add=
ed (selectable using NEW_VGIC). It might be worth to look at it.</div><div =
dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"></div><div c=
lass=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div><a href=3D"https://github.com/Xilinx/xen/" target=3D"_bla=
nk">https://github.com/Xilinx/xen/</a></div></div></blockquote></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">This is not the official Xen reposi=
tory and look like patches have been applied on top. I am afraid, I am not =
going to be able help here. Could you do the same experiment with Xen 4.11?=
</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div><br></di=
v><div>I ran some more testing and realized that results are the same with =
or without vwfi=3Dnative, which I think again points out that passthrough t=
hat I need to provide in device tree isn&#39;t valid.</div></div></blockquo=
te></div></div><div><br></div><div>This could also means that wfi is not us=
ed by the guest or you never go to the idle vCPU.</div><div><br></div><div>=
<div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr"><div><br></div><div>=C2=A0And of course, higher the frequency =
of interrupts results in higher jitter. I&#39;m still battling with Xilinx =
SDK and triple timer counter that&#39;s why I can&#39;t figure out what is =
the exact frequency set (I&#39;m just rising it and lowering it), I&#39;ll =
give my best to solve that ASAP because we need to know exact value of freq=
uency set.=C2=A0</div><div><br></div><div>Thanks in advance!</div></div><di=
v dir=3D"ltr"><div><br></div><div>Milan<br>=C2=A0</div></div><br><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Oct 12, 2018 at 12:29 AM Stef=
ano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@xilinx.com" target=
=3D"_blank">stefano.stabellini@xilinx.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Thu, 11 Oct 2018, Milan Boberic wrote:<br>
&gt; On Wed, Oct 10, 2018 at 6:41 PM Meng Xu &lt;<a href=3D"mailto:xumengpa=
nda@gmail.com" target=3D"_blank">xumengpanda@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The jitter may come from Xen or the OS in dom0.<br>
&gt; &gt; It will be useful to know what is the jitter if you run the test =
on PetaLinux.<br>
&gt; &gt; (It&#39;s understandable the jitter is gone without OS. It is als=
o common<br>
&gt; &gt; that OS introduces various interferences.)<br>
&gt; <br>
&gt; Hi Meng,<br>
&gt; well... I&#39;m using bare-metal application and I need it exclusively=
 to<br>
&gt; be ran on one CPU as domU (guest) without OS (and I&#39;m not sure how=
<br>
&gt; would I make the same app to be ran on PetaLinux dom0 :D haha).<br>
&gt; Is there a chance that PetaLinux as dom0 is creating this jitter and<b=
r>
&gt; how? Is there a way of decreasing it?<br>
&gt; <br>
&gt; Yes, there are no prints.<br>
&gt; <br>
&gt; I&#39;m not sure about this timer interrupt passthrough because I didn=
&#39;t<br>
&gt; find any example of it, in attachment I included xen-overlay.dtsi file=
<br>
&gt; which I edited to add passthrough, in earlier replies there are<br>
&gt; bare-metal configuration file. It would be helpful to know if those<br=
>
&gt; setting are correct. If they are not correct it would explain the<br>
&gt; jitter.<br>
&gt; <br>
&gt; Thanks in advance, Milan Boberic!<br>
<br>
Hi Milan,<br>
<br>
Sorry for taking so long to go back to this thread. But I am here now :)<br=
>
<br>
First, let me ask a couple of questions to understand the scenario<br>
better: is there any interference from other virtual machines while you<br>
measure the jitter? Or is the baremetal app the only thing actively<br>
running on the board?<br>
<br>
Second, it would be worth double-checking that Dario&#39;s patch to fix<br>
sched=3Dnull is not having unexpected side effects. I don&#39;t think so, i=
t<br>
would be worth testing with it and without it to be sure.<br>
<br>
I gave a look at your VM configuration. The configuration looks correct.<br=
>
There is no dtdev settings, but given that none of the devices you are<br>
assigning to the guest does any DMA, it should be OK. You want to make<br>
sure that Dom0 is not trying to use those same devices -- make sure to<br>
add &quot;xen,passthrough;&quot; to each corresponding node on the host dev=
ice<br>
tree.<br>
<br>
The error messages &quot;No valid vCPU found&quot; are due to the baremetal=
<br>
applications trying to configure as target cpu for the interrupt cpu1<br>
(the second cpu in the system), while actually only 1 vcpu is assigned<br>
to the VM. Hence, only cpu0 is allowed. I don&#39;t think it should cause<b=
r>
any jitter issues, because the request is simply ignored. Just to be<br>
safe, you might want to double check that the physical interrupt is<br>
delivered to the right physical cpu, which would be cpu1 in your<br>
configuration, the one running the only vcpu of the baremetal app. You<br>
can do that by adding a printk to xen/arch/arm/vgic.c:vgic_inject_irq,<br>
for example:<br>
<br>
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c<br>
index 5a4f082..208fde7 100644<br>
--- a/xen/arch/arm/vgic.c<br>
+++ b/xen/arch/arm/vgic.c<br>
@@ -591,6 +591,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,<br>
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;v-&gt;arch.vgic.lock, flags=
);<br>
<br>
+=C2=A0 =C2=A0 if (v !=3D current) printk(&quot;DEBUG irq slow path!\n&quot=
;);<br>
=C2=A0 =C2=A0 =C2=A0/* we have a new higher priority irq, inject it into th=
e guest */<br>
=C2=A0 =C2=A0 =C2=A0vcpu_kick(v);<br>
<br>
You don&#39;t want &quot;DEBUG irq slow path!&quot; to get printed.<br>
<br>
Finally, I would try to set the timer to generate events less frequently<br=
>
than every 1us and see what happens, maybe every 5-10us. In my tests,<br>
the IRQ latency overhead caused by Xen is around 1us, so injecting 1<br>
interrupt every 1us, plus 1us of latency caused by Xen, cannot lead to<br>
good results.<br>
<br>
I hope this helps, please keep us updated with your results, they are<br>
very interesting!<br>
</blockquote></div>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--00000000000076b60105780ab03e--


--===============6549488299877143070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6549488299877143070==--
