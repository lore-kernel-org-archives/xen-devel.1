From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Xen optimization
Date: Fri, 12 Oct 2018 10:43:42 -0700
Message-ID: <alpine.DEB.2.10.1810121035440.436@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <alpine.DEB.2.10.1810111024390.436@sstabellini-ThinkPad-X260>
 <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2082948586-1539365785=:436"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8met=my=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gB1Tp-0002Gl-Ud
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 17:44:06 +0000
In-Reply-To: <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1810121038110.436@sstabellini-ThinkPad-X260>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2082948586-1539365785=:436
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.10.1810121038111.436@sstabellini-ThinkPad-X260>

On Fri, 12 Oct 2018, Milan Boberic wrote:
> Hi Stefano, glad to have you back :D,
> this is my setup:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - dom0 is PetaLinux, has 1 vCPU and it's pinn=
ed for pCPU0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 - there is only one domU and this is my bare-=
metal app that also have one vCPU and it's pinned for pCPU1
> so yeah, there is only dom0 and bare-metal app on the board.
>=20
> Jitter is the same with and without Dario's patch.
>=20
> I'm still not sure about timer's passthrough because there is no mention =
of triple timer counter is device tree so I added:
>=20
> &ttc0 {
> =C2=A0 =C2=A0xen,passthrough =3D <0x1>;
> };
>=20
> at the end of the xen-overlay.dtsi file which I included in attachment.

This is definitely wrong. Can you please also post the full host device
tree with your modifications that you are using for Xen and Dom0?  You
should have something like:


        timer@ff110000 {
            compatible =3D "cdns,ttc";
            interrupt-parent =3D <0x2>;
            interrupts =3D <0x0 0x24 0x4 0x0 0x25 0x4 0x0 0x26 0x4>;
            reg =3D <0x0 0xff110000 0x0 0x1000>;
            timer-width =3D <0x20>;
            power-domains =3D <0x3b>;
            xen,passthrough;
        };

For each of the nodes of the devices you are assigning to the DomU.


> About patch you sent, I can't find this funcion void vgic_inject_irq in /=
xen/arch/arm/vgic.c file, this is link of git repository
> from where I build my xen so you can take a look if that printk can be pu=
t somewhere else.
>=20
> https://github.com/Xilinx/xen/

It's here: https://github.com/Xilinx/xen/blob/xilinx/stable-4.9/xen/arch/ar=
m/vgic.c#L462

BTW you are using a pretty old branch, I suggest you moving to:

https://github.com/Xilinx/xen/tree/xilinx/versal/xen/arch/arm

It will work on your board too and it is based on the much newer Xen
4.11.


> I ran some more testing and realized that results are the same with or wi=
thout vwfi=3Dnative, which I think again points out that
> passthrough that I need to provide in device tree isn't valid.

In reality, the results are the same with and without vwfi=3Dnative only
if the baremetal app never issues any wfi instructions.


> =C2=A0And of course, higher the frequency of interrupts results in higher=
 jitter. I'm still battling with Xilinx SDK and triple timer
> counter that's why I can't figure out what is the exact frequency set (I'=
m just rising it and lowering it), I'll give my best to
> solve that ASAP because we need to know exact value of frequency set.=C2=
=A0

Yep, that's important :-)


>=20
> Thanks in advance!
>=20
> Milan
> =C2=A0
>=20
>=20
> On Fri, Oct 12, 2018 at 12:29 AM Stefano Stabellini <stefano.stabellini@x=
ilinx.com> wrote:
>       On Thu, 11 Oct 2018, Milan Boberic wrote:
>       > On Wed, Oct 10, 2018 at 6:41 PM Meng Xu <xumengpanda@gmail.com> w=
rote:
>       > >
>       > > The jitter may come from Xen or the OS in dom0.
>       > > It will be useful to know what is the jitter if you run the tes=
t on PetaLinux.
>       > > (It's understandable the jitter is gone without OS. It is also =
common
>       > > that OS introduces various interferences.)
>       >
>       > Hi Meng,
>       > well... I'm using bare-metal application and I need it exclusivel=
y to
>       > be ran on one CPU as domU (guest) without OS (and I'm not sure ho=
w
>       > would I make the same app to be ran on PetaLinux dom0 :D haha).
>       > Is there a chance that PetaLinux as dom0 is creating this jitter =
and
>       > how? Is there a way of decreasing it?
>       >
>       > Yes, there are no prints.
>       >
>       > I'm not sure about this timer interrupt passthrough because I did=
n't
>       > find any example of it, in attachment I included xen-overlay.dtsi=
 file
>       > which I edited to add passthrough, in earlier replies there are
>       > bare-metal configuration file. It would be helpful to know if tho=
se
>       > setting are correct. If they are not correct it would explain the
>       > jitter.
>       >
>       > Thanks in advance, Milan Boberic!
>=20
>       Hi Milan,
>=20
>       Sorry for taking so long to go back to this thread. But I am here n=
ow :)
>=20
>       First, let me ask a couple of questions to understand the scenario
>       better: is there any interference from other virtual machines while=
 you
>       measure the jitter? Or is the baremetal app the only thing actively
>       running on the board?
>=20
>       Second, it would be worth double-checking that Dario's patch to fix
>       sched=3Dnull is not having unexpected side effects. I don't think s=
o, it
>       would be worth testing with it and without it to be sure.
>=20
>       I gave a look at your VM configuration. The configuration looks cor=
rect.
>       There is no dtdev settings, but given that none of the devices you =
are
>       assigning to the guest does any DMA, it should be OK. You want to m=
ake
>       sure that Dom0 is not trying to use those same devices -- make sure=
 to
>       add "xen,passthrough;" to each corresponding node on the host devic=
e
>       tree.
>=20
>       The error messages "No valid vCPU found" are due to the baremetal
>       applications trying to configure as target cpu for the interrupt cp=
u1
>       (the second cpu in the system), while actually only 1 vcpu is assig=
ned
>       to the VM. Hence, only cpu0 is allowed. I don't think it should cau=
se
>       any jitter issues, because the request is simply ignored. Just to b=
e
>       safe, you might want to double check that the physical interrupt is
>       delivered to the right physical cpu, which would be cpu1 in your
>       configuration, the one running the only vcpu of the baremetal app. =
You
>       can do that by adding a printk to xen/arch/arm/vgic.c:vgic_inject_i=
rq,
>       for example:
>=20
>       diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>       index 5a4f082..208fde7 100644
>       --- a/xen/arch/arm/vgic.c
>       +++ b/xen/arch/arm/vgic.c
>       @@ -591,6 +591,7 @@ void vgic_inject_irq(struct domain *d, struct v=
cpu *v, unsigned int virq,
>       =C2=A0out:
>       =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&v->arch.vgic.lock, flag=
s);
>=20
>       +=C2=A0 =C2=A0 if (v !=3D current) printk("DEBUG irq slow path!\n")=
;
>       =C2=A0 =C2=A0 =C2=A0/* we have a new higher priority irq, inject it=
 into the guest */
>       =C2=A0 =C2=A0 =C2=A0vcpu_kick(v);
>=20
>       You don't want "DEBUG irq slow path!" to get printed.
>=20
>       Finally, I would try to set the timer to generate events less frequ=
ently
>       than every 1us and see what happens, maybe every 5-10us. In my test=
s,
>       the IRQ latency overhead caused by Xen is around 1us, so injecting =
1
>       interrupt every 1us, plus 1us of latency caused by Xen, cannot lead=
 to
>       good results.
>=20
>       I hope this helps, please keep us updated with your results, they a=
re
>       very interesting!
>=20
>=20
>=20
--8323329-2082948586-1539365785=:436
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2082948586-1539365785=:436--
